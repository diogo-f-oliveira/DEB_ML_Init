function [data, auxData, metaData, txtData, weights] = mydata_Aetobatus_flagellum
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Myliobatidae';
metaData.species    = 'Aetobatus_flagellum'; 
metaData.species_en = 'Longheaded eagle ray'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW','MIN'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCim'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 26];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 9*30.5;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(28.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on v';
data.am = 19*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'YamaKawa2005';   
  temp.am = C2K(28.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 32;   units.Lb  = 'cm';  label.Lb  = 'disc width at birth';   bibkey.Lb  = 'YamaKawa2005';
data.Lp = 74.6;   units.Lp  = 'cm';  label.Lp  = 'disc width at puberty'; bibkey.Lp  = 'WhitMoor2013';
data.Lpm = 50;   units.Lpm  = 'cm';  label.Lpm  = 'disc width at puberty'; bibkey.Lpm  = 'WhitMoor2013';
data.Li  = 90;  units.Li  = 'cm';  label.Li  = 'ultimate disc width';   bibkey.Li  = 'WhitMoor2013'; 
  comment.Li = 'fishbase gives DW 72 cm';

data.Wwi  = 13.9e3;  units.Wwi  = 'g';  label.Wwi  = 'wet weight at disc width 72 cm';   bibkey.Wwi  = 'fishbase'; 

data.Ri  = 4/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'value for Aetobatus narinari: 4 pups per litter, 1 litter per yr';
  
% univariate data
% time - length
data.tL_f = [ ... % time since birth (yr), disc width (cm)
0.000	32.213
0.905	44.969
1.951	56.367
2.969	66.409
3.930	75.908
4.948	84.050
5.909	91.921
6.899	97.891
7.917	103.591
8.963	107.390
9.952	112.547
10.970	117.161
12.016	120.418
12.949	124.217
13.939	127.203
14.985	130.731
15.975	134.530
16.879	136.430
17.954	139.958
18.972	139.958];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f  = {'d','cm'}; label.tL_f  = {'time since birth','disc width','female'}; 
temp.tL_f = C2K(28.2); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'YamaKawa2005';  
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), disc width (cm)
0.000	33.027
0.933	44.697
1.923	55.825
2.912	66.138
3.958	74.280
4.948	80.793
5.938	86.493
6.927	92.735
7.945	97.620
9.048	101.962];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m  = {'d','cm'}; label.tL_m  = {'time since birth','disc width','male'}; 
temp.tL_m = C2K(28.2); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'YamaKawa2005';  
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 20 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'The cost for milk secretion is added to the investment from the reproduction buffer.';
D2 = 'Males are supposed to differ from females by {p_Am} and E_Hp only';
D3 = 'DW in tL data are much larger than max DW of 72 cm given by fishbase. confusion with Aetobatus narinari?';
D4 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Facts
F1 = 'At first, they are enclosed in an egg case while the developing embryos feed on the yolk. After the egg hatches, the pup remains in the oviduct and receives nourishment from a milky secretion';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '65DZ6'; % Cat of Life
metaData.links.id_ITIS = '564390'; % ITIS
metaData.links.id_EoL = '46561024'; % Ency of Life
metaData.links.id_Wiki = 'Aetobatus_flagellum'; % Wikipedia
metaData.links.id_ADW = 'Aetobatus_flagellum'; % ADW
metaData.links.id_Taxo = '160206'; % Taxonomicon
metaData.links.id_WoRMS = '278241'; % WoRMS
metaData.links.id_fishbase = 'Aetobatus-flagellum'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aetobatus_flagellum}}';   
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Aetobatus-flagellum}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'YamaKawa2005'; type = 'article'; bib = [ ...  
'doi = {10.1007/s10641-005-0217-0}, ' ...
'author = {Atsuko Yamaguchia and Itsuro Kawaharab and Shirou Ito}, ' ...
'title = {Occurrence, growth and food of longheaded eagle ray, \emph{Aetobatus flagellum}, in {A}riake {S}ound, {K}yushu, {J}apan}, ' ...
'year = {2005}, ' ...
'journal = {Environmental Biology of Fishes}, '...
'volume = {74}, ' ...
'pages = {229-238}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WhitMoor2013'; type = 'article'; bib = [ ...  
'doi = {10.11646/zootaxa.3752.1.12}, ' ...
'author = {William T. White and Alec B. M. Moore}, ' ...
'title = {Redescription of  \emph{Aetobatus flagellum} ({B}loch \& {S}chneider, 1801), an endangered eagle ray ({M}yliobatoidea: {M}yliobatidae) from the {I}ndo-West {P}acific}, ' ...
'year = {2013}, ' ...
'journal = {Zootaxa}, '...
'volume = {3752(1)}, ' ...
'pages = {199-213}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

