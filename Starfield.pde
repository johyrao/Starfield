//your code here
Particle[] bob;
void setup()
{
	size(800,800);
	background(0);
	bob = new Particle[200];
	for( int i = 0; i < bob.length; i++ )
	{
		if(i%2 == 0)
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
	for( int i = 0; i < bob.length; i++ )
	{
		bob[i].move();
		bob[i].show();
	}
}
interface Particle
{
	//your code here
	public void move();
	public void show();
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
		angle += .01;
	}
	public void show()
	{
		noStroke();
		fill(0);
		//fill((float)shade,(float)shade,(float)shade);
		ellipse(myX, myY, 10, 10);
	}

}
class JumboParticle implements Particle //uses inheritance
{
	//your code here
	float myX, myY, speed, angle;
	int shade;
	JumboParticle()
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
		angle += .01;
	}
	public void show()
	{
		noStroke();
		fill(255);
		//fill((float)shade,(float)shade,(float)shade);
		ellipse(myX, myY, 10, 10);
	}
}

