function [data, auxData, metaData, txtData, weights] = mydata_Rana_macrocnemis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Rana_macrocnemis'; 
metaData.species_en = 'Long-legged wood frog'; 

metaData.ecoCode.climate = {'BWh', 'BSk', 'Dsa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf', 'jiTg'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman'};    
metaData.date_subm  = [2019 05 29];              
metaData.email      = {'bas.kooijman@vu.nl'};            
metaData.address    = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data

data.ab = 20;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'amphibiaweb';   
  temp.ab = C2K(10);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tj = 2.5*365;  units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'amphibiaweb';
  temp.tj = C2K(10);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 4*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'MiauUzum2007';
  temp.tp = C2K(10);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 11*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'MiauUzum2007';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 4;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';   bibkey.Lp  = 'MiauUzum2007';
  comment.Lp = 'based on tj and tL data';
data.Lpm  = 4;    units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males';   bibkey.Lpm  = 'MiauUzum2007';
  comment.Lp = 'based on tj and tL data';
data.Li  = 5.9;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'MiauUzum2007';
data.Lim  = 5.5;    units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'MiauUzum2007';

data.Wwb = 0.0042;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'guess based on Anaxyrus americanus';
data.Wwp = 7;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';     bibkey.Wwp = 'guess';
  comment.Wwp = 'guess based on Rana_muscosa';
data.Wwi = 40;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'guess';
  comment.Wwi = 'guess based on Rana_muscosa: ';
data.Wwim = 32.4;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'guess';
  comment.Wwim = 'guess based on Rana_muscosa: (5.5/5.9)^3*40';

data.Ri  = 233/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '233 eggs per clutch, assumed: 1 clutch per yr';
  
% univariate data
% time-length data
data.tL_f = [ ... % yr class (yr), SVL (cm)
0.921	1.994
1.004	3.318
1.004	2.267
1.004	2.063
2.979	2.558
3.967	3.761
3.983	3.120
4.017	3.639
4.017	3.148
4.971	4.473
4.971	3.655
4.987	6.820
4.987	5.210
4.987	3.395
5.004	4.037
5.958	4.394
5.958	4.203
5.992	3.752
6.008	4.476
7.013	4.341
7.029	4.655
7.029	4.505
7.983	4.808
10.494	4.650];
data.tL_f(:,1) = (data.tL_f(:,1)  + 0.75)* 365; % convert yr since birth to d since puberty
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(10);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MiauUzum2007';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % yr class (yr), SVL (cm)
0.971	2.104
0.971	2.063
0.987	3.345
1.004	2.295
3.013	2.586
3.967	4.539
3.967	3.106
4.000	3.789
4.954	4.118
4.987	3.395
5.004	4.828
5.004	4.719
5.004	4.596
5.004	4.323
5.490	4.679
5.958	4.571
5.975	4.762
5.992	3.821
6.008	5.049
6.510	3.754
6.962	4.901
6.996	4.846
7.013	5.119
7.029	4.751
7.515	4.779
7.983	4.644
8.017	5.094];
data.tL_m(:,1) = (data.tL_m(:,1) + 0.75) * 365; % convert yr since birth to d since puberty
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m   = C2K(10);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MiauUzum2007';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 2 * weights.psd.v;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  


%% Links
metaData.links.id_CoL = '6WR68'; % Cat of Life
metaData.links.id_ITIS = '665365'; % ITIS
metaData.links.id_EoL = '329317'; % Ency of Life
metaData.links.id_Wiki = 'Rana_macrocnemis'; % Wikipedia
metaData.links.id_ADW = 'Rana_macrocnemis'; % ADW
metaData.links.id_Taxo = '89710'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Rana+macrocnemis'; % AmphibiaWeb
metaData.links.id_AnAge = 'Rana_macrocnemis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rana_macrocnemis}}';
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
bibkey = 'MiauUzum2007'; type = 'Article'; bib = [ ... 
'author = {Claude Miaud and Nazan \"{U}z\"{u}m and Aziz Avci and Kurtulus Olgun}, ' ... 
'year = {2007}, ' ...
'title = {Age, size and growth of the endemic {A}natolian mountain frog \emph{Rana holtzi} from {T}urkey}, ' ...
'journal = {Herpetological Journal}, ' ...
'volume = {17}, ' ...
'pages = {167-173}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Rana+macrocnemis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

