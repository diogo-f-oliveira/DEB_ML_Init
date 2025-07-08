function [data, auxData, metaData, txtData, weights] = mydata_Nothobranchius_furzeri
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Nothobranchiidae';
metaData.species    = 'Nothobranchius_furzeri'; 
metaData.species_en = 'Turquoise killifish'; 

metaData.ecoCode.climate = {'Cwc'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFpe'};
metaData.ecoCode.embryo  = {'Ft'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
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

data.ab = 20;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'BlazPola2013';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 13;      units.tp = 'd';    label.tp = 'time since  birth at puberty'; bibkey.tp = 'BlazPola2013';
  temp.tp = C2K(26);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 112;    units.am = 'd'; label.am = 'life span';                 bibkey.am = 'BlazPola2013';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.46;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'BlazPola2013';  
data.Lp  = 2.5;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'BlazPola2013'; 
data.Li  = 4.9;    units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'BlazPola2013';
data.Lim  = 6.8;    units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'BlazPola2013';

data.Wwb = 9.05e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'BeroGarc2016';
  comment.Wwb = 'based on egg diameter of 1.2 mm: pi/6*0.12^3';
data.Wwi = 0.55;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00389 * (TL in cm)^3.12';
data.Wwim = 1.54;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for male';    bibkey.Wwim = 'fishbase';
  comment.Wwim = 'based on 0.00389 * (TL in cm)^3.12';
 
% uni-variate data
% t-L/N data population NF221
data.tL_fNF221 = [ ... % time since birth (d), standard length (cm)
0.000	0.458
6.146	1.017
13      2.37 % puberty
13.659	2.525
19      2.9  % first spawn
20.488	3.186
27.659	3.525
41.659	4.271
62.829	4.610
84.000	4.542
112.341	4.373];
units.tL_fNF221   = {'d', 'cm'};  label.tL_fNF221 = {'time since birth', 'total length', 'female'};  
temp.tL_fNF221    = C2K(27.5);  units.temp.tL_fNF221 = 'K'; label.temp.tL_fNF221 = 'temperature';
bibkey.tL_fNF221 = 'BlazPola2013';
comment.tL_fNF221 = 'Data for females, population NF221; hatch at 16 C, till 2 d, then 25.3 C till 8 d';
%
data.tL_mNF221 = [ ... % time since birth (d), standard length (cm)
0.000	0.458
6.146	1.017
13      2.37 % puberty
13.659	2.525
19      3.52 % first spawn  
20.488	3.746
27.659	4.712
41.659	5.559
63.171	6.102
84.000	6.492
112.000	6.644];
units.tL_mNF221   = {'d', 'cm'};  label.tL_mNF221 = {'time since birth', 'total length', 'male'};  
temp.tL_mNF221    = C2K(27.5);  units.temp.tL_mNF221 = 'K'; label.temp.tL_mNF221 = 'temperature';
bibkey.tL_mNF221 = 'BlazPola2013';
comment.tL_mNF221 = 'Data for males, population NF221; hatch at 16 C, till 2 d, then 25.3 C till 8 d';
% reproduction
data.tN_NF221 = [ ... % time sing birth (d), number of eggs (#)
13  0 % puberty
19 12 % first spawn
21 12
42 203
63 244];
units.tN_NF221   = {'d', '#'};  label.tN_NF221 = {'time since birth', 'cum reproduction'};  
temp.tN_NF221    = C2K(27.5);  units.temp.tN_NF221 = 'K'; label.temp.tN_NF221 = 'temperature';
bibkey.tN_NF221 = 'BlazPola2013';
comment.tN_NF221 = 'Mean cumulative reproduction NF221; hatch at 16 C, till 2 d, then 25.3 C till 8 d';

% t-L/N data population NF222
data.tL_fNF222 = [ ... % time since birth (d), standard length (cm)
0.000	0.475
6.468	1.087
12      2.435 % puberty
13.957	2.733
18      3.220 % first spawn
20.085	3.328
27.574	3.585
40.851	4.046
62.638	4.409
84.085	4.653
111.319	4.508];
units.tL_fNF222   = {'d', 'cm'};  label.tL_fNF222 = {'time since birth', 'total length', 'female'};  
temp.tL_fNF222    = C2K(27.5);  units.temp.tL_fNF222 = 'K'; label.temp.tL_fNF222 = 'temperature';
bibkey.tL_fNF222 = 'BlazPola2013';
comment.tL_fNF222 = 'Data for females, population NF222; hatch at 16 C, till 2 d, then 25.3 C till 8 d';
%
data.tL_mNF222 = [ ... % time since birth (d), standard length (cm)
0.000	0.475
6.468	1.087
12      2.435 % puberty
13.957	2.733
18      3.790 % first spawn
20.766	3.803
27.574	4.619
41.191	5.538
62.979	6.290
83.404	6.636
112.340	6.797];
units.tL_mNF222   = {'d', 'cm'};  label.tL_mNF222 = {'time since birth', 'total length', 'male'};  
temp.tL_mNF222    = C2K(27.5);  units.temp.tL_mNF222 = 'K'; label.temp.tL_mNF222 = 'temperature';
bibkey.tL_mNF222 = 'BlazPola2013';
comment.tL_mNF222 = 'Data for males, population NF222; hatch at 16 C, till 2 d, then 25.3 C till 8 d';
% reproduction
data.tN_NF222 = [ ... % time since birth (d), number of eggs (#)
12  0 % puberty
18  2 % first spawn
21 24
42 112
63 120];
units.tN_NF222   = {'d', '#'};  label.tN_NF222 = {'time since birth', 'cum reproduction'};  
temp.tN_NF222    = C2K(27.5);  units.temp.tN_NF222 = 'K'; label.temp.tN_NF222 = 'temperature';
bibkey.tN_NF222 = 'BlazPola2013';
comment.tN_NF222 = 'Mean cumulative reproduction NF222; hatch at 16 C, till 2 d, then 25.3 C till 8 d';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fNF221 = 10 * weights.tL_fNF221;
weights.tL_mNF221 = 10 * weights.tL_mNF221;
weights.tL_fNF222 = 10 * weights.tL_fNF222;
weights.tL_mNF222 = 10 * weights.tL_mNF222;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_fNF221','tL_mNF221'}; subtitle1 = {'Data for females, males population NF221'};
set2 = {'tL_fNF222','tL_mNF222'}; subtitle2 = {'Data for females, males population NF222'};
set3 = {'tN_NF221','tN_NF222'}; subtitle3 = {'Data for population NF221, NF222'};
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
metaData.links.id_CoL = '47SLP'; % Cat of Life
metaData.links.id_ITIS = '647428'; % ITIS
metaData.links.id_EoL = '218173'; % Ency of Life
metaData.links.id_Wiki = 'Nothobranchius_furzeri'; % Wikipedia
metaData.links.id_ADW = 'Nothobranchius_furzeri'; % ADW
metaData.links.id_Taxo = '181385'; % Taxonomicon
metaData.links.id_WoRMS = '1013134'; % WoRMS
metaData.links.id_fishbase = 'Nothobranchius-furzeri'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Nothobranchius_furzeri}}';
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
'doi = {10.1186/2041-9139-4-24}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/60324}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

