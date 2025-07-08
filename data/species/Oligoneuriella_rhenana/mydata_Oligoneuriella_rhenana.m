function [data, auxData, metaData, txtData, weights] = mydata_Oligoneuriella_rhenana

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Insecta'; 
metaData.order      = 'Ephemeroptera'; 
metaData.family     = 'Oligoneuriidae';
metaData.species    = 'Oligoneuriella_rhenana'; 
metaData.species_en = 'Mayfly'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0eFl', '0eFp', '0eFm', 'eiTg'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'beH', 'beD', 'beS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'am'; 'Lj'; 'Wd0'; 'Wdj'; 'Ni'}; 
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 1.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 10 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 02 11];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 02 19]; 

%% set data
% zero-variate data

data.ab = 25;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Value taken from Ecdyonurus_dispar';
data.tj = 360;     units.tj = 'd';    label.tj = 'time since birth at emergence'; bibkey.tj = 'guess';   
  temp.tj = C2K(10);  units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
data.am = 7;    units.am = 'd';    label.am = 'life span as imago';        bibkey.am = 'guess';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1.5;   units.Lj  = 'cm';  label.Lj  = 'female body length at emergence, excluding tails';   bibkey.Lj  = 'Wiki';
  comment.Lj = 'male 1.7 cm; tails female 7 mm, male 14 mm; wings 15 mm';

data.Wd0 = 1.5/2500;   units.Wd0 = 'mg'; label.Wd0 = 'initial dry weight'; bibkey.Wd0 = {'guess'};
  comment.Wd0 = 'Taken from Ecdyonurus_dispar';
data.Wdj = 2.0; units.Wdj = 'mg';  label.Wdj = 'ultimate dry weight';      bibkey.Wdj = 'guess';
  comment.Wdj = 'Taken from Ecdyonurus_dispar';

data.Ni  = 2500;   units.Ni  = '#'; label.Ni  = 'cumulative # of eggs';     bibkey.Ni  = 'guess';   
  temp.Ni = C2K(16);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'Value taken from Ecdyonurus_dispar';
 
% uni-variate data
% t-L data
data.tL_Stura = [ ... % time since birth (d), length (mm)
8.576	0.736
17.796	0.960
26.885	1.149
34.861	1.287
42.971	1.568
49.061	2.219
54.230	2.512
65.473	2.574
71.293	2.706];
units.tL_Stura  = {'d', 'mm'};  label.tL_Stura = {'time since birth', 'length', 'Stura'};  
temp.tL_Stura   = C2K(15.61);  units.temp.tL_Stura = 'K'; label.temp.tL_Stura = 'temperature';
bibkey.tL_Stura = 'FenoBo2005';
comment.tL_Stura = ['time 0 corresponds with 23 April 2004; ' ...
    'length is mean of a head capsule width, pronotal length and total thorax length (including pterotecae); ' ...
    'temp is pm 5.1 C; site is Stura; ' ...
    'sampling from first appearance to emergence'];
% 
data.tL_Bormida = [ ... % time since birth (d), length (mm)
16.744	0.638
25.771	1.023
33.822	1.667
41.933	2.000
48.091	2.742
53.188	2.690
64.237	2.851
70.316	2.908];
units.tL_Bormida  = {'d', 'mm'};  label.tL_Bormida = {'time since birth', 'length', 'Bormida'};  
temp.tL_Bormida   = C2K(21.69);  units.temp.tL_Bormida = 'K'; label.temp.tL_Bormida = 'temperature';
bibkey.tL_Bormida = 'FenoBo2005';
comment.tL_Bormida = ['time 0 corresponds with 23 April 2004; ' ...
    'length is mean of a head capsule width, pronotal length and total thorax length (including pterotecae); ' ...
    'temp is pm 5.2 C; site is Bormida; ' ...
    'sampling from first appearance to emergence'];

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
set1 = {'tL_Stura','tL_Bormida'}; subtitle1 = {'Data from Stura, Bormida'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Life span (and h_a) relates to imago';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Imagos are extremely short lived and do not feed; nyphs allocate to reproduction buffer and have mature eggs';
metaData.bibkey.F1 = 'Sold1979'; 
F2 = 'Estimates of the number of instars in ephemeropterans vary between 10 and 50; most are in the range 15-25';
metaData.bibkey.F2 = {'Brit1982','what_when_how'}; 

metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '496DZ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '3684447'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '17334'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://fr.wikipedia.org/wiki/Oligoneuriella_rhenana}}';
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
bibkey = 'Sold1979'; type = 'Article'; bib = [ ... 
'author = {Soldan, T.}, ' ... 
'howpublished = {http://www.ephemeroptera-galactica.com/pubs/pub_s/pubsoldant1979p353.pdf}, ' ...
'year = {1979}, ' ...
'title = {The structure and development of the female internal reproductive system in six {E}uropean species of {E}phemeroptera}, ' ...
'journal = {Acta entomol. bohemoslovaca}, ' ...
'volume = {76}, ' ...
'pages = {353--365}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FenoBo2005'; type = 'Article'; bib = [ ... 
'author = {S. Fenoglio and T. Bo and M. Battegazzore and A. Morisi}, ' ... 
'howpublished = {http://www.sinica.edu.tw/zool/zoolstud/44.2/271.pdf}, ' ...
'year = {2005}, ' ...
'title = {Growth of \emph{Oligoneuriella rhenana} ({I}mhoff, 1852) ({E}phemeroptera: {O}ligoneuriidae) in Two Rivers with Contrasting Temperatures in {N}{W} {I}taly}, ' ...
'journal = {Zoological Studies}, ' ...
'volume = {44}, ' ...
'number = {2}, '...
'pages = {271--274}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'what_when_how'; type = 'Misc'; bib = ...
'howpublished = {\url{http://what-when-how.com/insects/ephemeroptera-mayflies-insects/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Brit1982'; type = 'Article'; bib = [ ... 
'author = {Brittain, J. E.}, ' ... 
'howpublished = {http://www.ephemeroptera-galactica.com/pubs/pub_b/pubbrittainj1982p119.pdf}, ' ...
'year = {1982}, ' ...
'title = {Biology of mayflies}, ' ...
'journal = {Ann. Rev. Entomol.}, ' ...
'volume = {27}, ' ...
'pages = {119--147}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

