function [data, auxData, metaData, txtData, weights] = mydata_Johnius_coitor
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Johnius_coitor'; 
metaData.species_en = 'Coitor croaker'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'0jMp', '0jMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 02 23];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 23];

%% set data
% zero-variate data

data.am = 7*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(28.3); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 11.4;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'SarkNask2018';
data.Li  = 28.5;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'SarkNask2018';

data.Wwb = 2.7e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'SarkNask2018';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 16.7;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'SarkNask2018','fishbase'};
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 261; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'SarkNask2018';
  comment.Wwi = 'based on 0.00724*Li^2.95, see F1, gives 134.5 g';

data.Ri = 121849/365;  units.Ri = '#/d';  label.Ri = 'reprod rate';  bibkey.Ri = 'SarkNask2018';
  temp.Ri = C2K(28.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
288.206	10.330
319.219	12.527
349.138	12.418
365+12.907	14.615
365+45.052	15.934
365+103.731	18.791
365+134.016	19.341
365+165.048	20.000
365+257.018	22.198
365+288.424	22.857
365+318.708	23.516
730+13.910	24.176
730+45.315	24.835
730+133.938	25.604];
data.tL(:,1) = data.tL(:,1) - 150; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ChowNasi2023';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00724*(TL in cm)^2.95';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3QQ59'; % Cat of Life
metaData.links.id_ITIS = '646604'; % ITIS
metaData.links.id_EoL = '46579013'; % Ency of Life
metaData.links.id_Wiki = 'Johnius'; % Wikipedia
metaData.links.id_ADW = 'Johnius_coitor'; % ADW
metaData.links.id_Taxo = '177650'; % Taxonomicon
metaData.links.id_WoRMS = '276104'; % WoRMS
metaData.links.id_fishbase = 'Johnius-coitor'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Johnius}}';
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
bibkey = 'ChowNasi2023'; type = 'Article'; bib = [ ... 
'author = {M. R. Chowdhury and M. Nasiruddin and M. A. Azadi and M. G. Mustafa}, ' ... 
'year = {2023}, ' ...
'title = {POPULATION DYNAMICS OF THE JEW FISH, \emph{Johnius coitor} ({H}AMILTON-{B}UCHANAN, 1822) FROM THE {B}AY OF {B}ENGAL, {B}ANGLADESH}, ' ...
'journal = {Bangladesh J. Environ. Sci.}, ' ...
'volume = {44}, ' ...
'pages = {85-92}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SarkNask2018'; type = 'Article'; bib = [ ... 
'doi = {10.1051/alr/2017042}, ' ...
'author = {Uttam Kumar Sarkar and Malay Naskar and Koushik Roy and Deepa Sudheesan and Sandipan Gupta and Arun Kumar Bose and Pankaj Kumar Srivastava and Saurav Kumar Nandy and Vinod Kumar Verma and Soma Das Sarkar and Gunjan Karnatak}, ' ... 
'year = {2018}, ' ...
'title = {Baseline information of reproduction parameters of anamphidromous croaker \emph{Johnius coitor} ({H}amilton, 1822) from {G}anga river basin, {I}ndia with special reference to potential influence of climatic variability}, ' ...
'journal = {Aquat. Living Resour.}, ' ...
'volume = {31}, ' ...
'pages = {4}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Johnius-coitor.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

