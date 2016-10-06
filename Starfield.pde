//your code here
Particle[] bob;
int x1 = -10;
int x2 = 840;
boolean running = false;
boolean showOriginalParticles = false;
void setup()
	{
 	size(800,800);
 	bob = new Particle[200];
 	for( int i = 0; i < bob.length; i++ )
 	{
 		if(i%2 == 0)
 		{
 			bob[i] = new NormalParticle();
 		}
 		else if(i%3 == 0)
 		{
 			bob[i] = new OddballParticle();
 		}
 		else 
 		{
 			bob[i] = new JumboParticle();
 		}
 	}
}
void draw()
	{
 	background(0);
 	if (running)
 	{
		if(x1 <= 390 || x2 >= 410)
 		{
			fill(255,0,0);
			ellipse(x1, 400, 10, 10);
			fill(255);
			ellipse(x2-12, 393, 25, 25);
			ellipse(x2+3, 388, 25, 25);
			ellipse(x2+13, 397, 25, 25);
			ellipse(x2-9, 413, 25, 25);
			ellipse(x2+12, 414, 25, 25);
			ellipse(x2-14, 403, 25, 25);
			ellipse(x2, 400, 25, 25);
 		x1 = x1 + 2;
 		x2 = x2 - 2;			
 		}	
 		else
 		{
 			for( int i = 0; i < bob.length; i++ )
 			{
 				bob[i].move();
 				bob[i].show();
 			}
 		}

 	}
}
void mousePressed()
{
 	running = true;
}
interface Particle
{
 	//your code here
 	public void move();
 	public void show();
 }
class NormalParticle implements Particle
{
	float myX, myY, speed, angle;
	int shade;
	NormalParticle()
	{
		myX = 400;
		myY = 400;
		shade = (int)(Math.random()*255);
		speed = (float)(Math.random()*7)-3;
		angle = (float)(Math.random()*(2*Math.PI)); 
	}
	public void move()
	{
		myX += Math.cos(angle)*(speed);
		myY += Math.sin(angle)*(speed);
		//angle += .01;
	}
	public void show()
	{
		noStroke();
		fill(255,0,0);
		//fill((float)shade,(float)shade,(float)shade);
		ellipse(myX, myY, 10, 10);
	}
}
class OddballParticle implements Particle //uses an interface
{
	//your code here
	float myX, myY, speed, angle;
	int shade;
	OddballParticle()
	{
		myX = 400;
		myY = 400;
		shade = (int)(Math.random()*255);
		speed = (float)(Math.random()*7)-3;
		angle = (float)(Math.random()*(2*Math.PI)); 
	}
	public void move()
	{
		myX += Math.cos(angle)*(speed);
		myY += Math.sin(angle)*(speed);
		//angle += .01;
	}
	public void show()
	{
		noStroke();
		fill(255,141,141);
		//fill((float)shade,(float)shade,(float)shade);
		ellipse(myX, myY, 15, 15);
	}
}
class JumboParticle extends OddballParticle //uses inheritance
{
	public void show()
	{
		noStroke();
		fill(255);
		//fill((float)shade,(float)shade,(float)shade);
		ellipse(myX, myY, 25, 25);
	}
}