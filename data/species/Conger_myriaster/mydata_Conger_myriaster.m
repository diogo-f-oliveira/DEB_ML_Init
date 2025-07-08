  function [data, auxData, metaData, txtData, weights] = mydata_Conger_myriaster

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Anguilliformes'; 
metaData.family     = 'Congridae';
metaData.species    = 'Conger_myriaster'; 
metaData.species_en = 'Whitespotted conger'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMpe', 'piMd'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8.8); % K, body temp
metaData.data_0     = {'am';  'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'W-N'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 05];

%% set data
% zero-variate data
data.ab = 9; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'HoriUtoh2002';   
  temp.ab = C2K(13); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '2 d to hatch, 7 d later mouths opens';
data.am = 8*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(8.8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 70;     units.Lp = 'cm';   label.Lp = 'total length at puberty for female';bibkey.Lp = 'MuZha2021';
data.Li = 100;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.1e-4; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'HoriUtoh2002';
  comment.Wwb = 'based on egg diameter of 0.992 mm: pi/6*0.0992^3';
data.Wwp = 315.6;    units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi: (70/100)^3*920';
data.Wwi = 920;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'fishbase: based on 0.00058*Li^3.23, see F1, gives 1.7e3';
    
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
1	22.267
2	34.564
3	45.367
4	63.353
5	68.020
6	71.343]; 
data.tL(:,1) = (0 + data.tL(:,1)) * 365;
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(8.8); units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'MuZha2018';

data.WN = [ ... % weight (g), specific fecundity (#/g)
220.000	4669.498
226.667	4499.730
230.000	6113.876
240.000	5410.194
261.667	4585.390
266.667	6151.025
266.667	5507.821
268.333	6029.699
271.667	4318.602
275.000	5617.213
278.333	3578.445
283.333	5362.527
306.667	3736.785
306.667	5132.417
311.667	5605.819
313.333	4938.377
318.333	3906.924
320.000	4805.016
323.333	4149.744
325.000	6431.331
326.667	5302.724
345.000	3324.939
348.333	4975.492
351.667	3786.239
351.667	4684.297
355.000	6092.132
360.000	4393.204
365.000	5303.499
371.667	4624.023
385.000	4939.826
388.333	3386.496
388.333	5862.224
395.000	4078.378
410.000	4806.837
418.333	4273.025
420.000	4661.408
430.000	4370.348
431.667	4018.440
448.333	3666.835
481.667	4322.849
483.333	4031.621
485.000	3776.800
488.333	3886.091
508.333	3850.088
518.333	3255.630
520.000	4093.042
531.667	3692.793
551.667	4202.906
560.000	4506.473
588.333	3766.754
601.667	3184.500
656.667	4144.350
663.333	2724.582
680.000	3380.259
681.667	3052.623
735.000	2616.808
740.000	2823.220
920.000	3057.443];
units.WN = {'g', '#/g'};     label.WN = {'weight', 'specific fecundity'};  
  temp.WN = C2K(8.8); units.temp.WN = 'K'; label.temp.WN = 'temperature'; 
bibkey.WN = 'MuZha2021';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Egg accumulation time in WN data is assumed to be 7 yrs';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00058*(TL in cm)^3.23'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'XLHL'; % Cat of Life
metaData.links.id_ITIS = '635926'; % ITIS
metaData.links.id_EoL = '46561403'; % Ency of Life
metaData.links.id_Wiki = 'Conger_myriaster'; % Wikipedia
metaData.links.id_ADW = 'Conger_myriaster'; % ADW
metaData.links.id_Taxo = '171605'; % Taxonomicon
metaData.links.id_WoRMS = '271745'; % WoRMS
metaData.links.id_fishbase = 'Conger-myriaster'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Conger_myriaster}}';  
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
bibkey = 'MuZha2018'; type = 'Article'; bib = [ ...
'doi = {10.1371/journal.pone.0203537}, ' ...
'author = {Mu, X. and Zhang, C. and Zhang, C. and Xu, B. and Xue, Y. and Ren, Y.}, ' ...
'year = {2018}, ' ...
'title = {Age determination for whitespotted conger \emph{Conger myriaster} through somatic and otolith morphometrics}, ' ... 
'journal = {PLoS ONE}, ' ...
'volume = {13(9)}, '...
'pages = {e0203537}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MuZha2021'; type = 'Article'; bib = [ ...
'doi = {10.1371/journal.pone.0203537}, ' ...
'author = {Mu, X. and Zhang, C. and Zhang, C. and Xu, B. and Xue, Y. and Ren, Y.}, ' ...
'year = {2018}, ' ...
'title = {Age determination for whitespotted conger \emph{Conger myriaster} through somatic and otolith morphometrics}, ' ... 
'journal = {PLoS ONE}, ' ...
'volume = {13(9)}, '...
'pages = {e0203537}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HoriUtoh2002'; type = 'Article'; bib = [ ...
'author = {Noriyuki Horie and Tomoko Utoh and Yoshiaki Yamada and Akihiro Okamura and Huan Zhang and Naomi Mikawa and Atsushi Akazawa and Satoru Tanaka AND Hideo P. Oka}, ' ...
'year = {2002}, ' ...
'title = {Development of embryos and larvae in the common {J}apanese conger \emph{Conger myriaster}}, ' ... 
'journal = {Fisheries Science}, ' ...
'volume = {68}, '...
'pages = {972–983}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Conger-myriaster.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
