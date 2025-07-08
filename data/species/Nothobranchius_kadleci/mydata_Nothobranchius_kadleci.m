function [data, auxData, metaData, txtData, weights] = mydata_Nothobranchius_kadleci
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Nothobranchiidae';
metaData.species    = 'Nothobranchius_kadleci'; 
metaData.species_en = 'Mozambique killifish'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFpe'};
metaData.ecoCode.embryo  = {'Ft'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi';}; 
metaData.data_1     = {'t-L_f'; 't-N_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 13]; 

%% set data
% zero-variate data

data.ab = 15;      units.ab = 'd';    label.ab = 'age at birth';                     bibkey.ab = 'BlazPola2013';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 11.5;      units.tp = 'd';    label.tp = 'time since birth at puberty';                 bibkey.tp = 'BlazPola2013';
  temp.tp = C2K(26);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 112;    units.am = 'd'; label.am = 'life span';                            bibkey.am = 'BlazPola2013';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.51;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';           bibkey.Lb  = 'BlazPola2013';  
data.Lp  = 2.22;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';        bibkey.Lp  = 'BlazPola2013'; 
data.Li  = 5.0;    units.Li  = 'cm';  label.Li  = 'ultimate total length for females';  bibkey.Li  = 'BlazPola2013';
data.Lim  = 6.0;    units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males'; bibkey.Lim  = 'BlazPola2013';

data.Wwb = 9.05e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'BeroGarc2016';
  comment.Wwb = 'based on egg diameter of 1.2 mm of Nothobranchius_furzeri: pi/6*0.12^3';
data.Wwi = 0.59;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';  bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00389 * (TL in cm)^3.12';
data.Wwim = 1.15;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for male'; bibkey.Wwim = 'fishbase';
  comment.Wwim = 'based on 0.00389 * (TL in cm)^3.12';

% uni-variate data
% t-L/N data population NK91
data.tL_fNK91 = [ ... % time sing birth (d), standard length (cm)
0.000	0.407
6.062	1.084
12      2.280 % puberty
13.802	2.642    
17      3.240 % first spawn
19.891	3.133
27.336	3.640
40.894	4.062
62.260	4.431
83.293	4.648
111.471	4.458];
units.tL_fNK91   = {'d', 'cm'};  label.tL_fNK91 = {'time since birth', 'total length', 'female'};  
temp.tL_fNK91    = C2K(27.5);  units.temp.tL_fNK91 = 'K'; label.temp.tL_fNK91 = 'temperature';
bibkey.tL_fNK91 = 'BlazPola2013';
comment.tL_fNK91 = 'Data for females, population NK91; hatch at 16 C, till 2 d, then 25.3 C till 8 d';
%
data.tL_mNK91 = [ ... % time sing birth (d), standard length (cm)
0.000	0.407
6.062	1.084
12      2.280 % puberty
13.802	2.642
17      3.360 % first spawn
19.879	3.404
27.315	4.131
40.874	4.519
62.218	5.414
83.237	5.970
111.744	6.017];
units.tL_mNK91   = {'d', 'cm'};  label.tL_mNK91 = {'time since birth', 'total length', 'male'};  
temp.tL_mNK91    = C2K(25.5);  units.temp.tL_mNK91 = 'K'; label.temp.tL_mNK91 = 'temperature';
bibkey.tL_mNK91 = 'BlazPola2013';
comment.tL_mNK91 = 'Data for males, population NK91; hatch at 16 C, till 2 d, then 25.3 C till 8 d';
% reproduction
data.tN_NK91 = [ ... % time sing birth (d), number of eggs (#)
12  0 % puberty
17  6 % first spawn
21 19
42 80
63 90];
units.tN_NK91   = {'d', '#'};  label.tN_NK91 = {'time since birth', 'cum reproduction'};  
temp.tN_NK91    = C2K(27.5);  units.temp.tN_NK91 = 'K'; label.temp.tN_NK91 = 'temperature';
bibkey.tN_NK91 = 'BlazPola2013';
comment.tN_NK91 = 'Mean cumulative reproduction NK91; hatch at 16 C, till 2 d, then 25.3 C till 8 d';

% t-L/N data population NK430
data.tL_fNK430 = [ ... % time sing birth (d), standard length (cm)
0.000	0.475
6.740	1.119
11      2.22  % puberty
13.802	2.678
17      3.13  % first spawn
20.557	3.441
27.656	4.102
41.544	4.746
62.563	5.305
83.607	5.254
112.114	5.305];
units.tL_fNK430   = {'d', 'cm'};  label.tL_fNK430 = {'time since birth', 'total length', 'female'};  
temp.tL_fNK430    = C2K(27.5);  units.temp.tL_fNK430 = 'K'; label.temp.tL_fNK430 = 'temperature';
bibkey.tL_fNK430 = 'BlazPola2013';
comment.tL_fNK430 = 'Data for females, population NK430; hatch at 16 C, till 2 d, then 25.3 C till 8 d';
%
data.tL_mNK430 = [ ... % time sing birth (d), standard length (cm)
0.000	0.475
6.740	1.119
11      2.22  % puberty
13.802	2.678
17      3.36  % first spawn
20.541	3.814
27.635	4.610
41.520	5.305
62.549	5.627
83.575	6.017
111.399	6.169];
units.tL_mNK430   = {'d', 'cm'};  label.tL_mNK430 = {'time since birth', 'total length', 'male'};  
temp.tL_mNK430    = C2K(27.5);  units.temp.tL_mNK430 = 'K'; label.temp.tL_mNK430 = 'temperature';
bibkey.tL_mNK430 = 'BlazPola2013';
comment.tL_mNK430 = 'Data for males, population NK430; hatch at 16 C, till 2 d, then 25.3 C till 8 d';
% reproduction
data.tN_NK430 = [ ... % time sing birth (d), number of eggs (#)
11   0 % puberty
17  17 % first spawn
21  39
42 295
63 335];
units.tN_NK430   = {'d', '#'};  label.tN_NK430 = {'time since birth', 'cum reproduction'};  
temp.tN_NK430    = C2K(27.5);  units.temp.tN_NK430 = 'K'; label.temp.tN_NK430 = 'temperature';
bibkey.tN_NK430 = 'BlazPola2013';
comment.tN_NK430 = 'Mean cumulative reproduction NK91; hatch at 16 C, till 2 d, then 25.3 C till 8 d';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fNK91 = 10 * weights.tL_fNK91;
weights.tL_mNK91 = 10 * weights.tL_mNK91;
weights.tL_fNK430 = 10 * weights.tL_fNK430;
weights.tL_mNK430 = 10 * weights.tL_mNK430;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_fNK91','tL_mNK91'}; subtitle1 = {'Data for females, males population NK91'};
set2 = {'tL_fNK430','tL_mNK430'}; subtitle2 = {'Data for females, males population NK430'};
set3 = {'tN_NK91','tN_NK430'}; subtitle3 = {'Data for population NF221, NF222'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww = 0.00389 * (TL in cm)3.12';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '47SM7'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '14016035'; % Ency of Life
metaData.links.id_Wiki = 'Nothobranchius'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3417980'; % Taxonomicon
metaData.links.id_WoRMS = '1008133'; % WoRMS
metaData.links.id_fishbase = 'Nothobranchius-kadleci'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Nothobranchius_kadleci}}';
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
bibkey = 'BeroGarc2016'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {N. Berois and G. Garcia and R. O. de Sa}, ' ...
'year = {2016}, ' ...
'title  = {Anual fishes: life history strategy, diverty and evolution}, ' ...
'publisher = {CRC Press, Boca Raton}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BlazPola2013'; type = 'Article'; bib = [ ... 
'author = {R. Bla\v{z}ek and M. Pola\v{c}ik and M. Reichard}, ' ... 
'year = {2013}, ' ...
'title = {Rapid growth, early maturation and short generation time in {A}frican annual fishes}, ' ...
'journal = {EvoDevo}, ' ...
'volume = {4}, ' ...
'pages = {24}, ' ...
'howpublished = {\url{http://www.evodevojournal.com/content/4/1/2}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/60324}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

