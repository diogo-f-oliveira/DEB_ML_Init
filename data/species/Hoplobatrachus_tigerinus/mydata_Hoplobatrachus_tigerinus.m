function [data, auxData, metaData, txtData, weights] = mydata_Hoplobatrachus_tigerinus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Discoglossidae';
metaData.species    = 'Hoplobatrachus_tigerinus'; 
metaData.species_en = 'Indus Valley bullfrog'; 

metaData.ecoCode.climate = {'Dfb', 'Cwa', 'BSh', 'BWh'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0bFm', 'biTg'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {'TW'};
metaData.ecoCode.food    = {'biCi', 'piCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Li'; 'Wwb'; 'Wwj'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 24]; 


%% set data
% zero-variate data

data.ab = 4;    units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'DashHota1980';   
  temp.ab = C2K(31.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 28;    units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'DashHota1980';   
  temp.tj = C2K(31.5);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 60;  units.tp = 'd';    label.tp = 'time since metam at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(31.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'guess based on Pyxicephalus_adspersus';
data.am = 10.9*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(31.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Hoplobatrachus occipitalis';

data.Lj  = 4.3;  units.Lj  = 'cm';  label.Lj  = 'total length at metam';    bibkey.Lj  = 'amphibiaweb'; 
  comment.Lj = 'tadpole, tail 23-26 mm';
data.Li  = 20.5;   units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'DashHota1980';

data.Wwb = 0.04; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'DashHota1980';
data.Wwj = 0.845; units.Wwj = 'g';   label.Wwj = 'wet weight at metam';     bibkey.Wwj = 'DashHota1980';
data.Wwi = 875;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'DashHota1980';

data.Ri  = 1800/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'DashHota1980';   
temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = '2.5-2.8 mm egg diameter, 1 brood/year';
 
% uni-variate data
% time-weight for tadpoles
data.tW1 = [ ... % time since hatch (d), wet weight (g)
1.064	0.041
4.288	0.080
7.569	0.140
11.063	0.253
14.439	0.428
17.873	0.625
21.149	0.788
24.420	0.827
27.713	0.803];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since hatch', 'wet weight', '1 ind/2 litre'};  
temp.tW1    = C2K(31.5);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1  = 'DashHota1980';
comment.tW1 = '1 indivual per 2 litre aquarium';
%
data.tW5 = [ ... % time since hatch (d), wet weight (g)
0.052	0.055
2.450	0.094
6.529	0.258
9.540	0.446
13.438	0.676
16.611	0.838
20.345	0.930
23.598	0.919
24.965	0.901];
units.tW5   = {'d', 'g'};  label.tW5 = {'time since hatch', 'wet weight', '5 ind/2 litre'};  
temp.tW5    = C2K(31.5);  units.temp.tW5 = 'K'; label.temp.tW5 = 'temperature';
bibkey.tW5 = 'DashHota1980';
comment.tW5 = '5 indivuals per 2 litre aquarium';
%
data.tW10 = [ ... % time since hatch (d), wet weight (g)
0.053	0.053
2.525	0.096
6.695	0.225
9.814	0.341
13.733	0.525
16.449	0.696
20.523	0.871
23.600	0.914
27.455	0.905];
units.tW10   = {'d', 'g'};  label.tW10 = {'time since hatch', 'wet weight', '10 ind/2 litre'};  
temp.tW10    = C2K(31.5);  units.temp.tW10 = 'K'; label.temp.tW10 = 'temperature';
bibkey.tW10 = 'DashHota1980';
comment.tW10 = '10 indivuals per 2 litre aquarium';
%
data.tW20 = [ ... % time since hatch (d), wet weight (g)
0.126	0.057
2.758	0.081
6.503	0.149
9.631	0.245
13.492	0.389
16.746	0.542
20.366	0.717
23.639	0.827
27.470	0.872
29.292	0.850
30.505	0.839];
units.tW20   = {'d', 'g'};  label.tW20 = {'time since hatch', 'wet weight', '20 ind/2 litre'};  
temp.tW20    = C2K(31.5);  units.temp.tW20 = 'K'; label.temp.tW20 = 'temperature';
bibkey.tW20  = 'DashHota1980';
comment.tW20 = '20 indivuals per 2 litre aquarium';
%
data.tW40 = [ ... % time since hatch (d), wet weight (g)
0.053	0.053
2.837	0.074
6.596	0.111
9.657	0.188
13.534	0.297
16.736	0.398
20.599	0.538
23.407	0.673
27.280	0.791
32.095	0.830];
units.tW40   = {'d', 'g'};  label.tW40 = {'time since hatch', 'wet weight', '40 ind/2 litre'};  
temp.tW40    = C2K(31.5);  units.temp.tW40 = 'K'; label.temp.tW40 = 'temperature';
bibkey.tW40  = 'DashHota1980';
comment.tW40 = '40 indivuals per 2 litre aquarium';
%
data.tW80 = [ ... % time since hatch (d), wet weight (g)
0.050	0.059
2.991	0.068
6.524	0.102
9.686	0.124
13.591	0.172
16.432	0.235
20.543	0.327
23.612	0.388
27.570	0.484
30.557	0.559
34.287	0.659
37.500	0.733
41.024	0.790
44.263	0.807
48.050	0.783];
units.tW80   = {'d', 'g'};  label.tW80 = {'time since hatch', 'wet weight', '80 ind/2 litre'};  
temp.tW80    = C2K(31.5);  units.temp.tW80 = 'K'; label.temp.tW80 = 'temperature';
bibkey.tW80 = 'DashHota1980';
comment.tW80 = '80 indivuals per 2 litre aquarium';
%
data.tW120 = [ ... % time since hatch (d), wet weight (g)
0.051	0.057
3.075	0.048
6.765	0.072
9.706	0.080
13.474	0.097
16.925	0.145
20.454	0.191
23.683	0.230
27.438	0.276
30.664	0.322
34.342	0.372
37.641	0.424
41.241	0.476
44.386	0.535
48.139	0.585
51.060	0.638
55.116	0.686
57.968	0.725
61.793	0.784
64.813	0.783
68.298	0.759];
units.tW120   = {'d', 'g'}; label.tW120 = {'time since hatch', 'wet weight', '120 ind/2 litre'};  
temp.tW120    = C2K(31.5);  units.temp.tW120 = 'K'; label.temp.tW120 = 'temperature';
bibkey.tW120  = 'DashHota1980';
comment.tW120 = '120 indivuals per 2 litre aquarium';

%% set weights for all real data
weights = setweights(data, []);
weights.tW1(end) = 0;
weights.tW5(end - [0 1]) = 0;
weights.tW10(end ) = 0;
weights.tW20(end - [0 1]) = 0;
weights.tW80(end) = 0;
weights.tW120(end - [0 1]) = 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW1','tW5','tW10','tW20','tW40','tW80','tW120'}; subtitle1 = {'Data for 1,5,10,20,40,80,120 ind/2l'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Tadpoles are assumed to differ from frogs by del_M and {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '6MC5J'; % Cat of Life
metaData.links.id_ITIS = '586353'; % ITIS
metaData.links.id_EoL = '331125'; % Ency of Life
metaData.links.id_Wiki = 'Hoplobatrachus_tigerinus'; % Wikipedia
metaData.links.id_ADW = 'Hoplobatrachus_tigerinus'; % ADW
metaData.links.id_Taxo = '143092'; % Taxonomicon
metaData.links.id_WoRMS = '1423452'; % WoRMS
metaData.links.id_amphweb = 'Hoplobatrachus+tigerinus'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hoplobatrachus_tigerinus}}';
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
bibkey = 'DashHota1980'; type = 'Article'; bib = [ ... 
'author = {M. C. Dash and A. K. Hota}, ' ... 
'year = {1980}, ' ...
'title = {DENSITY EFFECTS ON THE SURVIVAL, GROWTH RATE, AND METAMORPHOSIS OF \emph{Rana trigrina} TADPOLES}, ' ...
'journal = {Ecology}, ' ...
'number = {5}, ' ...
'volume = {6}, ' ...
'pages = {1025--1028}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/species/4715}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Hoplobatrachus_occipitalis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
