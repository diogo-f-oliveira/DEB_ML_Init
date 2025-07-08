function [data, auxData, metaData, txtData, weights] = mydata_Otolithoides_pama
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Otolithoides_pama'; 
metaData.species_en = 'Pama croaker'; 

metaData.ecoCode.climate = {'A','MA'};
metaData.ecoCode.ecozone = {'TPi','MI','MPSW'};
metaData.ecoCode.habitat = {'0jFl', 'jiFr', 'piMc'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 15];

%% set data
% zero-variate data

data.am = 30*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(28.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 19.6;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'fishbase'; 
data.Li  = 34;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'BhakDas2021';
  comment.Li = 'fishbase gives TL 160 cm, but this is at odds with Lp and tL data';

data.Wwb = 2.2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at puberty';  bibkey.Wwb = 'BhakDas2021';
  comment.Wwb = 'based on egg diameter og 0.75 mm: pi/6*0.075^3';
data.Wwp = 54;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00617*Lp^3.05, see F1';
data.Wwi = 289;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = {'fishbase','BhakDas2021'};
  comment.Wwi = 'based on 0.00617*Li^3.05, see F1';
 
% uni-variate data
% time - length
data.tL = [ ... % time since birth (d), total length (cm)
256.977	5.069
365+44.306	13.345
365+71.312	12.931
365+103.382	15.000
365+133.763	15.207
365+164.988	16.966
365+225.329	18.828
365+255.289	19.759
365+286.092	19.966
365+318.162	21.931
730+103.803	24.931
730+133.763	26.483
730+195.792	26.793
730+257.821	26.897
730+318.162	27.828
1095+104.225	28.034
1095+257.399	29.897
1095+319.006	30.103];
data.tL(:,1) = data.tL(:,1)-200; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MustAhme2020';

% length-fecundity
data.LN = [ ... % log10 total length (mm), log10 fecundity (#)
2.031	3.700
2.065	4.032
2.066	3.827
2.066	3.955
2.074	3.678
2.081	3.916
2.088	3.717
2.119	4.044
2.119	3.806
2.127	4.094
2.130	4.149
2.130	4.011
2.146	4.172
2.148	4.039
2.154	4.150
2.156	4.022
2.158	3.778
2.160	3.967
2.163	4.139
2.168	3.862
2.171	4.050
2.176	4.150
2.191	3.995
2.192	3.867
2.194	3.762
2.205	4.377
2.208	4.061
2.210	4.239
2.212	4.006
2.216	3.951
2.220	4.239
2.220	4.062
2.224	4.195
2.225	4.150
2.253	4.472
2.262	4.034
2.267	4.062
2.268	4.505
2.270	4.223
2.270	4.400
2.277	4.184
2.280	3.990
2.281	4.090
2.284	4.710
2.284	3.940
2.286	4.084
2.287	4.312
2.292	3.974
2.296	4.494
2.303	4.400
2.310	4.018
2.312	4.345
2.322	3.902
2.322	3.830
2.328	4.722
2.331	4.384
2.331	3.874
2.335	4.905
2.336	4.805
2.338	4.373
2.343	4.905
2.345	4.085
2.349	4.367
2.353	4.151
2.356	4.318
2.361	4.451
2.361	4.063
2.380	4.573
2.381	4.263
2.396	4.263
2.408	4.684
2.446	5.011
2.459	5.089
2.476	4.901
2.487	5.239
2.520	5.244];
data.LN = 10.^data.LN; data.LN(:,1) = data.LN(:,1)/10; % remove log transform, convert mm to cm
units.LN  = {'cm', '#'};  label.LN = {'fork length','fecundity'};  
temp.LN   = C2K(28.5);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'BhakDas2021';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Wwi = 3 * weights.Wwi;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Li (and Wwi) data were ignored due to inconsistency with Lp and tL data';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.00617*(TL in cm)^3.05'; 
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '4B7FV'; % Cat of Life
metaData.links.id_ITIS = '646660'; % ITIS
metaData.links.id_EoL = '46579192'; % Ency of Life
metaData.links.id_Wiki = 'Otolithoides'; % Wikipedia
metaData.links.id_ADW = 'Otolithoides_pama'; % ADW
metaData.links.id_Taxo = '182363'; % Taxonomicon
metaData.links.id_WoRMS = '281950'; % WoRMS
metaData.links.id_fishbase = 'Otolithoides-pama'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Otolithoides}}';
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
bibkey = 'MustAhme2020'; type = 'Article'; bib = [ ... 
'doi = {10.9734/bpi/crtbs/v1}, ' ...
'author = {Md. Golam Mustafa and Imran Ahmed and Mohammod Ilyas},'...
'title = {Population Dynamics of Five Important Commercial Fish Species in the {S}undarbans Ecosystem of {B}angladesh: Recent Advancement},'...
'journal = {Current Research Trends in Biological Science}, '...
'volume = {1}, '...
'year = {2020}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BhakDas2021'; type = 'Article'; bib = [ ... 
'doi = {10.21077/ijf.2021.68.1.90574-04}, ' ...
'author = {Dibakar Bhakta and Sudhir Kumar Das and B. K. Das and T. S. Nagesh},'...
'title = {Biology of reproduction in \emph{Otolithoides pama} ({H}amilton, 1822) in {H}ooghly-{M}atlah {E}stuary of {W}est {B}engal, {I}ndia},'...
'journal = {Indian J. Fish.}, '...
'volume = {68(1)}, '...
'pages = {27-39}, ' ...
'year = {2021}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Otolithoides-pama.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

