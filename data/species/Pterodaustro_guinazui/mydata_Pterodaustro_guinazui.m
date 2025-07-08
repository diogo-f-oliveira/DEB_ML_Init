function [data, auxData, metaData, txtData, weights] = mydata_Pterodaustro_guinazui

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Pterosauria'; 
metaData.family     = 'Ctenochasmatidae';
metaData.species    = 'Pterodaustro_guinazui'; 
metaData.species_en = 'Pterodaustro'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0bTd', 'biMm'};
metaData.ecoCode.embryo  = {'Ts'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Li'; 'Ww0'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 10 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 11 01]; 

%% set data
% zero-variate data

data.tp = 2*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ChinCodo2008';
  temp.tp = C2K(37); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 7*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'ChinCodo2008';   
  temp.am = C2K(37); units.temp.am = 'K'; label.temp.am = 'temperature'; 

%data.L0 = 6;         units.L0 = 'cm';   label.L0 = 'egg length';            bibkey.L0 = 'Wiki';
%  comment.L0 = 'Eggs are 2.2 cm wide';
data.Lb = 3;         units.Lb = 'cm';   label.Lb = 'skull length at birth';  bibkey.Lb = 'ChinCodo2008';
data.Li = 29;        units.Li = 'cm';   label.Li = 'skull length';           bibkey.Li = 'Wiki';

data.Ww0 = 30;       units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';    bibkey.Ww0 = 'Wiki';
  comment.Ww0 = 'Based on egg length and width: Ww0 = (6/1.1)*4/3*pi*1.1^3';
data.Wwi = 4.5e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'jurassicpark';

data.Ri  = 10/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(37); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Very speculative';
 
% uni-variate data
% t-W data
data.tL = [ ... % time since birth (yr), wet weight (kg)
0.533	3.289
1.385	10.412
1.967	14.170
3.303	20.438
4.951	26.710
5.639	28.281
6.918	28.061];
units.tL   = {'yr', 'cm'};  label.tL = {'time since birth', 'skull length'};  
temp.tL    = C2K(37);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ChinCodo2008';
comment.tL = 'Temperature is speculative; lengths unscaled';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Several data are very speculative, such as T, Wwb, Ri';
D2 = 'Generalised logistic growth is assumed to account for retarded neonate growth due to lower body temperature';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Extinct, lived around 105 Ma ago';
metaData.bibkey.F1 = 'reptileevolution'; 
F2 = 'Wing diameter up to 250 cm';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = ''; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '47449703'; % Ency of Life
metaData.links.id_Wiki = 'Pterodaustro_guinazui'; % Wikipedia
metaData.links.id_Taxo = '50713'; % Taxonomicon

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pterodaustro}}';
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
bibkey = 'ChinCodo2008'; type = 'Article'; bib = [ ... 
'author = {A. Chinsamy and L. Codorniu and L. Chiappe}, ' ... 
'year = {2008}, ' ...
'title = {Developmental growth patterns of the filter-feeder pterosaur, \emph{Pterodaustro guinazui}}, ' ...
'journal = {Biol. Lett.}, ' ...
'volume = {4}, ' ...
'pages = {282-285}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'reptileevolution'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.reptileevolution.com/pterodaustro-embryo.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'jurassicpark'; type = 'Misc'; bib = ...
'howpublished = {\url{http://jurassicpark.wikia.com/wiki/Pterodaustro}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

