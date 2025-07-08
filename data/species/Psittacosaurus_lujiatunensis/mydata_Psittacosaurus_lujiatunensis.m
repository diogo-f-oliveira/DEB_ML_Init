function [data, auxData, metaData, txtData, weights] = mydata_Psittacosaurus_lujiatunensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Ornithischia'; 
metaData.family     = 'Psittacosauridae';
metaData.species    = 'Psittacosaurus_lujiatunensis'; 
metaData.species_en = 'Psittacosaurus'; 

metaData.ecoCode.climate = {'BS', 'Df'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTi', '0iTs'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 08 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   


metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 08 22]; 

%% set data
% zero-variate data

data.tp = 9*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ErikMako2009';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 12*365;    units.am = 'd';    label.am = 'life span';                  bibkey.am = 'ErikMako2009';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 250; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'ErikMako2009';
data.Wwi = 38.4e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';         bibkey.Wwi = 'ErikMako2009';
  
data.Ri  = 34/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';       bibkey.Ri  = 'ErikMako2009';   
  temp.Ri = C2K(37);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (yr), wet weight (g)
0.476	427.850
0.916	358.364
0.989	250.664
2.967	3775.952
3.040	2213.158
3.077	1858.048
4.066	3495.663
4.066	2998.327
4.982	4564.637
4.982	4209.397
6.960	8834.541
6.996	7982.095
7.033	11321.479
7.949	12461.501
7.985	10756.479
8.022	14806.344
8.938	22624.871
9.963	26749.297
11.026	26682.023];
data.tW(:,1) = 365 * data.tW(:,1); % convert yr to d
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(37);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'ErikMako2009';
comment.tW = 'Temperature is speculative; weights reconstructured from bone lengths';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 3 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 2 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Ri is probably too large, giving a low kappa and less-than-perfect fit';
D2 = 'Neonate growth is possibly retarted by lower body temperature';
D3 = 'k_J  was fixed at 0.001 1/d in view of P mongoliensis';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'Extinct, lived 123.2 till 100 Ma ago';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = ''; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '4532055'; % Ency of Life
metaData.links.id_Wiki = 'Psittacosaurus'; % Wikipedia
metaData.links.id_Taxo = '51062'; % Taxonomicon

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Psittacosaurus}}';
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
bibkey = 'ErikMako2009'; type = 'Article'; bib = [ ... 
'doi = {10.1002/ar.20992}, ' ...
'author = {Gregory M. Erickeson and Peter J. Makovicky and Brian D. Inouye and Chang-Fu Zhou and Andke-Qin Gao}, ' ... 
'year = {2009}, ' ...
'title = {A Life Table for \emph{Psittacosaurus lujiatunensis}: {I}nitial Insights Into Ornithischian Dinosaur Population Biology}, ' ...
'journal = {The Anatomical Record}, ' ...
'volume = {292}, ' ...
'pages = {1514–1521}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

