using NUnit.Framework;

namespace DotNetTestLocaleTest
{
    [TestFixture]
    public class TestClass
    {
        [Test]
        public void Addition()
        {
            Assert.That(2 + 2, Is.EqualTo(4));
        }
    }
}
