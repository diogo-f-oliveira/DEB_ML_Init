function [data, auxData, metaData, txtData, weights] = mydata_Oncorhynchus_gorbuscha

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Oncorhynchus_gorbuscha'; 
metaData.species_en = 'Pink salmon'; 

metaData.ecoCode.climate = {'MC','Dfc'};
metaData.ecoCode.ecozone = {'MPN','TH'};
metaData.ecoCode.habitat = {'0jFr', 'jiMpe'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'bjCi', 'jiCii', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(7); 
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 07 16];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 16]; 


%% set data
% zero-variate data
  
  data.ab = 60;    units.ab = 'd';    label.ab = 'age at birth';     bibkey.ab = 'fishbase';  
    temp.ab = C2K(9);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
    comment.ab = 'value for O. keta';
  data.am = 3*365;    units.am = 'd';    label.am = 'life span';    bibkey.am = 'fishbase';           
    temp.am = C2K(7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
 
  data.Lp  = 45;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
  data.Li  = 76;  units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';
  
  data.Wwb = 0.1575;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'fishbase';  
    comment.Wwb = 'based on egg diameter of 6.7 mm of O. keta: pi/6*0.67^3';
  data.Wwp = 1.42e3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
    comment.Wwp = 'based on 0.01148*Lp^3.08, see F2';
  data.Wwi = 7.13e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
    comment.Wwi = 'based on 0.01148*Li^3.08, see F2';

  data.NR  = 2000;   units.NR  = '#';   label.NR  = 'eggs at the end of life';bibkey.NR  = 'fishbase';   
    temp.NR = C2K(7); units.temp.NR = 'K'; label.temp.NR = 'temperature';

% Uni-variated data
% time-length
data.tL = [ % ... % time since birth (yr), ln fork length (cm)
13.042	1.242
19.002	1.337
23.842	1.395
27.942	1.483
33.164	1.629
37.978	1.477
39.876	1.790
43.212	1.710
50.272	1.689
53.674	2.141
55.860	1.784
62.572	1.945
67.790	2.055
97.136	1.883
102.371	2.123
109.820	2.241
117.994	2.205
129.916	2.417
143.319	2.579
155.226	2.667
218.831	2.957
302.154	3.372
374.662	3.517
380.969	3.416
386.193	3.569
394.759	3.701
396.606	3.599
407.014	3.593
411.497	3.775
418.546	3.659
427.109	3.762
431.573	3.784
448.309	3.844
466.533	3.911
478.424	3.876
478.430	3.920
486.602	3.870
497.758	3.900
504.087	3.973
513.729	3.785];
data.tL(:,2) = exp(data.tL(:,2))/0.95; % convert ln FL to TL
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(7);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'LeBrPark1964';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females (deviating morphology develops during migration upstream river)';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length=length from photo: FL = 0.95*TL';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww in g = 0.01148*(TL in cm)^3.08';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'occasionaly hybridizes with O. keta, known as miko salmon, which are steriele';
metaData.bibkey.F3 = 'Wiki'; 
F4 = 'dies soon after spawning';
metaData.bibkey.F4 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3, 'F4',F4);

%% Links
metaData.links.id_CoL = '74N5S'; % Cat of Life
metaData.links.id_ITIS = '161975'; % ITIS
metaData.links.id_EoL = '46563135'; % Ency of Life
metaData.links.id_Wiki = 'Oncorhynchus_gorbuscha'; % Wikipedia
metaData.links.id_ADW = 'Oncorhynchus_gorbuscha'; % ADW
metaData.links.id_Taxo = '42804'; % Taxonomicon
metaData.links.id_WoRMS = '127182'; % WoRMS
metaData.links.id_fishbase = 'Oncorhynchus-gorbuscha'; % fishbase


%% References%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Oncorhynchus_gorbuscha}}';
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
bibkey = 'LeBrPark1964'; type = 'Article'; bib = [ ... 
'doi = {10.1139/f64-100}, ' ...
'author = {R. J. LeBrasseur and R. R. Parker }, ' ... 
'year = {1964}, ' ...
'title = {Growth Rate of {C}entral {B}ritish {C}olumbia Pink Salmon (\emph{Oncorhynchus gorbuscha})}, ' ...
'journal = {Journal of the Fisheries Research Board of Canada}, ' ...
'volume = {21(5)}, ' ...
'pages = {1101-1128}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Oncorhynchus-gorbuscha.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
