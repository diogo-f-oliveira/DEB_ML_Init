function [data, auxData, metaData, txtData, weights] = mydata_Carcharhinus_leucas

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Carcharhinus_leucas'; 
metaData.species_en = 'Bull shark'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iFl', '0iMc', '0iMr'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biCvf', 'biCvr', 'biSvm'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(30); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Adrian Gleiss'};    
metaData.date_subm = [2015 04 21];              
metaData.email    = {'adrian.gleiss@gmail.com'};            
metaData.address  = {'University of Western Autralia, WA 6009, Australia'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 30];


%% set data
% zero-variate data

data.ab = 11 * 30.5;  units.ab = 'd';    label.ab = 'age at birth';       bibkey.ab = 'Wiki';   
  temp.ab = C2K(30);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temperature from free-ranging adult bull sharks, generally between 28-32 C';
data.tp = 6 * 365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'fisbase';
  temp.tp = C2K(30);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 32*365;     units.am = 'd';    label.am = 'life span';          bibkey.am = 'fisbase';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 60;        units.Lb  = 'cm';  label.Lb  = 'fork length at birth'; bibkey.Lb  = 'BranStil1987';  
data.Lp  = 180;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty';  bibkey.Lp  = 'BranStil1987'; 
data.Li  = 320;   units.Li  = 'cm';  label.Li  = 'ultimate fork length';    bibkey.Li  = 'McCoLamb2009';

data.Wwb = 2490; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'SchmMurr1994';
  comment.Wwb = 'Coverted from length at birth presented in SchmMurr1994 using length-weight chart in BranStil1987';
data.Wwp = 84860;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'BranStil1987';
  comment.Wwp = 'Coverted from length at birth presented in SchmMurr1994 using length-weight chart in BranStil1987';
data.Wwi = 410000;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'McCoLamb2009';

data.Ri  = 0.0356164;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'fisbase';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Maximum reported number of pups in Bull Sharks is 13 per cycle, sharks bear 1 litter per year (gestation period 10-12 months)'; 

  % uni-variate data
% t-L data
% fork length and wet weight were measured at the same time
data.tL = [ 1387.43	1394.73	1394.73	1387.43	1512.26	1534.525	1541.825	1526.86	1718.12	1725.785	1710.82	1725.785	1887.48	1887.48	1880.18	1880.18	2049.175	2041.875	2056.475	2049.175	2233.135	2247.735	2255.035	2255.035	2431.695	2424.395	2417.095	2417.095	2601.055	2593.39	2601.055	2601.055	2784.65	2791.95	2784.65	2784.65	2961.31	2968.61	2954.01	2961.31	3145.27	3137.97	3159.87	3152.57;    % time since birth
      138.80	135.70	133.4	127.2	146.4	144.1	141	133.9	150.4	148.1	144.1	141	151.7	149	147.7	145	161.5	162.8	158.4	155.7	169.5	165.5	161.5	157.9	171.3	169.9	169.9	163.3	177.1	173.9	173.5	163.7	181.1	178	178.8	169.5	183.7	182.8	179.3	170.4	187.3	184.6	181.5	173.5]';  % physical length (fork length at f and T)
%data.tL(:,1) = data.tL(:,1)/12;
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length', '24 C'};  
temp.tL    = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'SchmMurr1994';
%
data.tWw = [1390.72	1390.72	1390.72	1530.15	1541.83	1535.99	1541.83	1721.77	1721.77	1721.77	1721.77	1878.72	1872.88	1884.56	1878.72	1884.56	2041.51	2041.51	2041.51	2047.35	2047.35	2244.82	2262.34	2250.66	2250.66	2250.66	2436.44	2430.60	2424.76	2424.76	2436.44	2436.44	2610.55	2610.55	2616.39	2616.39	2616.39	2790.86	2779.18	2796.70	2790.86	2790.86	2970.80	2970.80	2970.80	2976.64	2976.64	3151.11	3151.11	3162.43	3162.43	3162.43;    % time since birth
    41740.00	38940.00	34290.00	48880.00	46710.00	43290.00	40190.00	51370.00	50430.00	47330.00	45470.00	58200.00	55710.00	54470.00	52610.00	50750.00	63790.00	63480.00	59750.00	57580.00	55400.00	71550.00	64410.00	62240.00	62240.00	58820.00	74660.00	71240.00	68140.00	68140.00	66580.00	62860.00	84290.00	82420.00	76520.00	73730.00	73420.00	92670.00	92360.00	88320.00	80870.00	81180.00	93600.00	91120.00	88320.00	82420.00	79940.00	103900.00	97640.00	97640.00	91430.00	87080.00]';  % Wet Weight at f and T
%data.tWw(:,1) = data.tWw(:,1)/12;
units.tWw = {'d', 'g'};     label.tWw = {'time since birth', 'wet weight'};  
  temp.tWw = C2K(24);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'SchmMurr1994';

data.tL30 = [1713.01	3173.01	3149.65	3149.65	3361.35	3432.16	3502.605	3502.605	3526.33	3526.33	3808.84	3785.48	3903.01	3879.65	3855.925	3879.65	4022	4113.25	4208.15	4303.05	4186.25	4233.7	4233.7	4492.85	4372.4	4540.3	4752	4587.75	4587.75	4985.6	4963.7	4985.6	4916.25	5317.75	5317.75	6376.25	6445.6	7128.15	7153.7	7883.7	7883.7	8237.75	8212.2	8237.75	8613.7	8540.7	8967.75	9011.55	9106.45	8920.3	9037.1	9318.15;% time since birth
      106.1240935	124.4157937	127.2360999	131.2651088	135.8581789	136.9863014	137.5503626	130.7010475	127.8001612	118.6946011	131.82917	135.2941176	134.7300564	136.4222401	140.451249	145.6083803	143.2715552	146.1724416	141.0153102	138.1144239	138.1144239	135.2941176	132.3932313	136.9863014	143.8356164	146.7365028	147.3005641	154.1498791	156.4061241	135.8581789	139.8871878	153.0217566	158.178888	157.0507655	159.8710717	180.4995971	184.4480258	181.0636583	183.8839645	187.9129734	191.377921	189.0410959	196.4544722	198.7912973	190.1692184	197.6631749	194.7622885	202.1756648	203.3843674	210.2336825	210.2336825	216.5189363]';  % physical length (fork length at f and T)
%data.tL30(:,1) = data.tL30(:,1)/12;
units.tL30 = {'d', 'cm'};     label.tL30 = {'time since birth', 'fork length', '30 C'};  
temp.tL30 = C2K(30);  units.temp.tL30 = 'K'; label.temp.tL30 = 'temperature';
bibkey.tL30 = 'BranStil1987';

data.LW30 = [107.8968574	121.2731668	131.7485898	132.715552	141.2570508	137.4697824	135.5358582	132.715552	128.8477035	131.7485898	138.4367446	138.4367446	143.190975	146.9782434	141.2570508	143.190975	137.4697824	148.9121676	150.8460919	153.6663981	153.6663981	158.4206285	171.796938	163.174859	152.6994359	172.7639001	162.288477	162.288477	158.4206285	189.9274778	185.1732474	192.747784	198.4689766	189.9274778	192.747784	187.0265915	189.9274778	193.7147462	199.4359388	199.4359388	192.747784	181.3053989	185.1732474	197.5020145	196.6156326	203.2232071	196.6156326	198.4689766	202.3368251	204.1901692	192.747784	199.4359388	205.1571313	211.8452861	212.8122482	196.6156326	197.5020145	203.2232071	204.1901692	207.0910556	209.9113618	214.6655923	212.8122482	210.8783239	208.9443997	215.6325544	218.5334408	215.6325544	217.5664786	211.8452861	207.0910556	197.5020145	202.3368251	220.467365	217.5664786	215.6325544	208.9443997	211.8452861	219.5004029; %fork-length
       23440	24740	24310	28610	30330	31200	30330	31200	31200	35070	34210	38520	38520	44110	45410	47130	50140	49710	50570	50140	50140	46270	50140	52300	54020	59190	60480	60480	68660	82440	91910	92340	93640	94070	95790	95790	100100	99670	99230	99230	105300	109100	111700	109600	112600	116500	117300	119000	119900	119500	119000	122900	123300	123800	120800	128900	137100	132400	135000	135000	135000	133700	138000	140100	143600	144900	150900	150000	156100	155600	153100	150900	163000	166800	169000	177200	182300	191000	198700]'; %wet weight in g
units.LW30 = {'cm', 'g'};     label.LW30 = {'fork length', 'wet weight'};  
bibkey.LW30 = 'BranStil1987';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL30','tL'}; subtitle1 = {'Data at 30, 24 C'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'egg (not foetal) development';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'R3NW'; % Cat of Life
metaData.links.id_ITIS = '160275'; % ITIS
metaData.links.id_EoL = '46559783'; % Ency of Life
metaData.links.id_Wiki = 'Carcharhinus_leucas'; % Wikipedia
metaData.links.id_ADW = 'Carcharhinus_leucas'; % ADW
metaData.links.id_Taxo = '41977'; % Taxonomicon
metaData.links.id_WoRMS = '105792'; % WoRMS
metaData.links.id_fishbase = 'Carcharhinus-leucas'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Carcharhinus_leucas}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SchmMurr1994'; type = 'Article'; bib = [ ... 
'author = {Schmid, T. H. and Murru, F. L.}, ' ... 
'year = {1994}, ' ...
'title = {Bioenergetics of the Bull Shark, \emph{Carcharhinus leucas}, maintained in captivity}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {645}, ' ...
'number = {13}, '...
'pages = {177-185}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BranStil1987'; type = 'Article'; bib = [ ... 
'author = {Branstetter, S. and Stiles, S.}, ' ... 
'year = {1987}, ' ...
'title = {Age and growth estimates of the bull shark, \emph{Carcharhinus leucas}, from the northern {G}ulf of {M}exico}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {645}, ' ...
'number = {20}, '...
'pages = {169-181}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'McCoLamb2009'; type = 'Article'; bib = [ ... 
'author = {McCord, M. E. and Lamberth, S. J.}, ' ... 
'year = {2009}, ' ...
'title = {Catching and tracking the worlds largest {Z}ambezi (bull) shark \emph{Carcharhinus leucas} in the {B}reede {E}stuary, {S}outh {A}frica: the first 43 hours}, ' ...
'journal = {African Journal of Marine Science}, ' ...
'volume = {645}, ' ...
'number = {31}, '...
'pages = {107-111}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fisbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Carcharhinus-leucas.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

