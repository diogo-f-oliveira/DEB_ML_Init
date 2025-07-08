function [data, auxData, metaData, txtData, weights] = mydata_Pungitius_pungitius

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Gasterosteidae';
metaData.species    = 'Pungitius_pungitius'; 
metaData.species_en = 'Ten-spined stickleback'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MA', 'MP', 'TH'};
metaData.ecoCode.habitat = {'piMc', '0iFe', '0iFl', '0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 04 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc = [2015 08 28];      

%% set data
% zero-variate data

data.ab = 6.5;      units.ab = 'd';   label.ab = 'age at birth';                bibkey.ab = 'fishbase';   
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 547;     units.ap = 'd';    label.ap = 'age at puberty';              bibkey.ap = 'AnAge';
  temp.ap = C2K(10);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 5 * 365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.63;   units.Lb  = 'cm';  label.Lb  = 'standard length at birth';   bibkey.Lb  = 'WrigWoot2004'; 
  comment.Lb = 'Taken from from Gasterosteus aculeatus';
data.Lp  = 3.70;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 7.40;   units.Li  = 'cm';  label.Li  = 'ultimate standard length';   bibkey.Li  = 'Paep1983';

data.Wwb = 0.01102 * data.Lb^3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'Computed as 0.01102 * Lb^3'; 
data.Wwp = 0.01102 * data.Lp^3;   units.Wwp = 'g'; label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'fishbase';
  comment.Wwp = 'Computed as 0.01102 * Lp^3'; 
data.Wwi = 0.01102 * data.Li^3;   units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'Computed as 0.01102 * Li^3'; 

data.Ri  = 80/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';                bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [... % time (d), standard length (cm)
0.685	2.259
31.855	2.953
62.276	3.513
94.361	3.731
123.917	4.000
154.268	3.565
183.837	4.010
214.226	4.114
245.455	4.166
275.401	3.969
306.206	4.000
336.631	4.611
367.003	4.487
396.491	3.782]; 
data.tL(:,1) = data.tL(:,1) + 70; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time', 'standard length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'JoneHyne1950';
comment.tL = 'temp is guessed'; 
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.ap = 0 * weights.ap;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'tp is ignorned, because mean temperature is unsure';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Ww = 0.01102 L^3 g, L = standard length in cm';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6WPH5'; % Cat of Life
metaData.links.id_ITIS = '166387'; % ITIS
metaData.links.id_EoL = '46567446'; % Ency of Life
metaData.links.id_Wiki = 'Pungitius_pungitius'; % Wikipedia
metaData.links.id_ADW = 'Pungitius_pungitius'; % ADW
metaData.links.id_Taxo = '44805'; % Taxonomicon
metaData.links.id_WoRMS = '126507'; % WoRMS
metaData.links.id_fishbase = 'Pungitius-pungitius'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pungitius_pungitius}}';
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
bibkey = 'JoneHyne1950'; type = 'Article'; bib = [ ... 
'author = {Jones, J. W. and Hynes, H. B. N.}, ' ... 
'year = {1950}, ' ...
'title = {The age and growth of \emph{Gasterosteus aculeatus}, \emph{Pygosteus pungitius} and \emph{Spinachia vulgaris} as shown by their otoliths}, ' ...
'journal = {J. Anim. Ecol.}, ' ...
'volume = {19}, ' ...
'pages = {59--73}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WrigWoot2004'; type = 'Article'; bib = [ ... 
'author = {H. A. Wright and R. J. Wootton and I. Barber}, ' ... 
'year = {2004}, ' ...
'title = {Interpopulation variation in early growth of threespine sticklebacks (\emph{Gasterosteus aculeatus}) under laboratory conditions}, ' ...
'journal = {Can. J. Fish. Aquat. Sci.}, ' ...
'volume = {61}, ' ...
'pages = {1832-1838}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Paep1983'; type = 'Book'; bib = [ ... 
'author = {Paepke, H.-J.}, ' ... 
'year = {1983}, ' ...
'title = {Die  Stichlinge.}, ' ...
'series = {Die Neue Brehm-Buecherei}, ' ...
'volume = {10}, ' ...
'publisher = {A. Ziemsen Verlag DDR, WittenBerg Lutherstadt}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pungitius_pungitius}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Pungitius_pungitius/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/3273}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
