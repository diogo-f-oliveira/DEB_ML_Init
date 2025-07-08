  function [data, auxData, metaData, txtData, weights] = mydata_Salvelinus_alpinus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Salvelinus_alpinus'; 
metaData.species_en = 'Arctic char'; 

metaData.ecoCode.climate = {'MC','ME','Dfc','ET'};
metaData.ecoCode.ecozone = {'MAN','MN','TH'};
metaData.ecoCode.habitat = {'0jFr','jiMpe'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwh'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-Ww'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2014 09 26];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 27]; 

%% set data
% zero-variate data
data.ah = 44;     units.ah = 'd';   label.ah = 'age at birth';           bibkey.ah = 'YaniHisa2002'; 
  temp.ah = C2K(8.5); units.temp.ah = 'K'; label.temp.ah = 'temperature';
  comment.ah = '39-49 d';
data.ab = data.ah + 26.5; units.ab = 'd'; label.ab = 'age at birth';     bibkey.ab = 'YaniHisa2002'; 
  temp.ab = C2K(7); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'ah + 25-28 d';
data.ap = 3*365;  units.ap = 'd';   label.ap = 'age at puberty';         bibkey.ap = 'fishbase';
  temp.ap = C2K(7); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'temp is guessed';
data.am = 4*365;  units.am = 'd';   label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 2;      units.Lb = 'cm';  label.Lb = 'total length at birth';  bibkey.Lb = 'guess';
comment.Lb = 'From Salmo trutta';
data.Lp = 35;     units.Lp = 'cm';  label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase'; 
data.Li = 107;    units.Li = 'cm';  label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwh = 0.0044; units.Wwh = 'g';   label.Wwh = 'wet weight at hatch';    bibkey.Wwh = 'GrubWies1983';
  comment.Wwh = 'this value seems very small, given Lb, Li and Wi, even if Lh would be 1 mm';
data.Wwi = 15e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  
data.Ri = 3e3/365; units.Ri = '#/d'; label.Ri = 'maximum reprod rate';   bibkey.Ri = {'fishbase'};   
  temp.Ri = C2K(7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'temp is guessed';
    
% uni-variate data
% time-weight
% initial weight 0.79 g
data.tW = [... % time since birth (d), wet weight (g)
0    	0.609
15.791	1.420
31.388	2.333
46.804	4.310
62.210	5.172
78.003	6.897
92.656	8.570
108.449	10.345
124.053	12.069
139.279	14.249
154.494	14.909];
units.tW = {'d', 'g'};     label.tW = {'time since birth', 'wet weight'};  
temp.tW = C2K(8.5); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = {'YaniHisa2002'};
 
%% set weights for all real data
weights = setweights(data, []);
weights.Wwh = 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'weight 0 was given to Wh, because value does not seem realistic';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'In N-Am 3 subspecies: S. a. erythrinus, S. a. oquassa (sunapee or blueback trout), S. a. taranetzi (taranets or dwarf Arctic char); In Eurasia:S. a. alpinus';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Char does not die after spawning like Pacific salmon and often spawn several times throughout their lives, typically every second or third year. ';
metaData.bibkey.F2 = 'Wiki'; 
F3 = 'Young char emerge from the gravel in spring and stay in the river from 5 to 7 months or until they are about 15 to 20 cm in length.';
metaData.bibkey.F3 = 'Wiki'; 
F4 = 'Best culturing temp 7.5-12.5 C.';
metaData.bibkey.F4 = 'YaniHisa2002'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);
                                 
%% Links
metaData.links.id_CoL = '79G2M'; % Cat of Life
metaData.links.id_ITIS = '162001'; % ITIS
metaData.links.id_EoL = '1156463'; % Ency of Life
metaData.links.id_Wiki = 'Salvelinus_alpinus'; % Wikipedia
metaData.links.id_ADW = 'Salvelinus_alpinus'; % ADW
metaData.links.id_Taxo = '42831'; % Taxonomicon
metaData.links.id_WoRMS = '127188'; % WoRMS
metaData.links.id_fishbase = 'Salvelinus-alpinus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Arctic_char}}';  
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
bibkey = 'GrubWies1983'; type = 'Article'; bib = [ ...  
'author = {Gruber, K. and Wieser, W.}, ' ...
'year = {1983}, ' ...
'title = {Energetics of development of the alpine charr, \emph{Salvelinus alpinus}, in relation to temperature and oxygen}, ' ... 
'journal = {J. Comp. Physiol.}, ' ...
'volume = 149, '...
'pages = {485--493}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'YaniHisa2002'; type = 'Article'; bib = [ ...  
'author = {T. Yanik and S. A. Hisar and C. B\"{o}l\"{u}kbas}, ' ...
'year = {2002}, ' ...
'title = {EARLY DEVELOPMENT AND GROWTH OF ARCTIC CHARR (\emph{Salvelinus alpinus}) AND RAINBOW TROUT (\emph{Oncorhynchus mykiss}) AT A LOW WATER TEMPERATURE.}, ' ... 
'journal = {The Israeli Journal of Aquaculture - Bamidgeh}, ' ...
'volume = {54(2)}, '...
'pages = {73}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/247}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
