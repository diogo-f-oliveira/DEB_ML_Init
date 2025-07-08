function [data, auxData, metaData, txtData, weights] = mydata_Indoplanorbis_exustus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Bulinidae';
metaData.species    = 'Indoplanorbis_exustus'; 
metaData.species_en = 'Freshwater snail'; 

metaData.ecoCode.climate = {'BSk', 'Am', 'Af'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFl', '0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHa', 'biHl'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Ri_T'}; 
metaData.data_1     = {'t-L_T'; 't-Ww_T'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 31]; 

%% set data
% zero-variate data

data.am = 150; units.am = 'd';    label.am = 'life span';                bibkey.am = 'RautRahm1992';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lb  = 0.092; units.Lb  = 'cm';  label.Lb  = 'shell diameter at birth';   bibkey.Lb  = 'RautRahm1992';
data.Lp  = 0.8; units.Lp  = 'cm';  label.Lp  = 'shell diameter at puberty'; bibkey.Lp  = 'RautRahm1992';
data.Li  = 1.5; units.Li  = 'cm';  label.Li  = 'ultimate shell diameter';   bibkey.Li  = 'RautRahm1992';

data.Wwb  = 0.15e-3; units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';   bibkey.Wwb  = 'RautRahm1992';

data.R35  = 798.68/16;   units.R35  = '#/d'; label.R35  = 'mean reproduction rate';     bibkey.R35  = 'RautRahm1992';   
  temp.R35 = C2K(35);  units.temp.R35 = 'K'; label.temp.R35 = 'temperature';
data.R30  = 968.45/23;   units.R30  = '#/d'; label.R30  = 'mean reproduction rate';     bibkey.R30  = 'RautRahm1992';   
  temp.R30 = C2K(18);  units.temp.R30 = 'K'; label.temp.R30 = 'temperature';
data.R25  = 902.18/50;   units.R25  = '#/d'; label.R25  = 'mean reproduction rate';     bibkey.R25  = 'RautRahm1992';   
  temp.R25 = C2K(10);  units.temp.R25 = 'K'; label.temp.R25 = 'temperature';
data.R20  = 582.77/57;   units.R20  = '#/d'; label.R20  = 'mean reproduction rate';     bibkey.R20  = 'RautRahm1992';   
  temp.R20 = C2K(10);  units.temp.R20 = 'K'; label.temp.R20 = 'temperature';
 
% uni-variate data
% time - length
data.tL35 = [ ... % age (d), shell diameter (cm)
0.473	0.063
28.055	0.681
56.173	1.184
83.879	1.427];
units.tL35   = {'d', 'cm'};  label.tL35 = {'time since birth', 'shell diameter', '35 C'};  
temp.tL35    = C2K(35);  units.temp.tL35 = 'K'; label.temp.tL35 = 'temperature';
bibkey.tL35 = 'RautRahm1992';
%
data.tL30 = [ ... % age (d), shell diameter (cm)
0.032	0.097
29.027	0.747
56.463	1.186
84.801	1.351
112.594	1.366];
units.tL30   = {'d', 'cm'};  label.tL30 = {'time since birth', 'shell diameter', '30 C'};  
temp.tL30    = C2K(30);  units.temp.tL30 = 'K'; label.temp.tL30 = 'temperature';
bibkey.tL30 = 'RautRahm1992';
%
data.tL25 = [ ... % age (d), shell diameter (cm)
0.478	0.070
27.958	0.368
55.401	0.779
83.371	1.085
110.905	1.217
124.202	1.218];
units.tL25   = {'d', 'cm'};  label.tL25 = {'time since birth', 'shell diameter', '25 C'};  
temp.tL25    = C2K(25);  units.temp.tL25 = 'K'; label.temp.tL25 = 'temperature';
bibkey.tL25 = 'RautRahm1992';
%
data.tL20 = [ ... % age (d), shell diameter (cm)
0.474	0.053
27.623	0.276
54.766	0.517
83.396	0.749
112.033	0.964
140.233	1.000
166.951	1.028
188.728	1.029];
units.tL20   = {'d', 'cm'};  label.tL20 = {'time since birth', 'shell diameter', '20 C'};  
temp.tL20    = C2K(20);  units.temp.tL20 = 'K'; label.temp.tL20 = 'temperature';
bibkey.tL20 = 'RautRahm1992';

% time - weight
data.tWw35 = [ ... % age (d), wet weight (g)
0.969	0.011
28.089	0.114
56.546	0.309
83.503	0.511];
units.tWw35   = {'d', 'g'};  label.tWw35 = {'time since birth', 'wet weight', '35 C'};  
temp.tWw35    = C2K(35);  units.temp.tWw35 = 'K'; label.temp.tWw35 = 'temperature';
bibkey.tWw35 = 'RautRahm1992';
%
data.tWw30 = [ ... % age (d), wet weight (g)
0.975	0.011
28.524	0.107
55.779	0.321
82.850	0.410
111.091	0.427];
units.tWw30   = {'d', 'g'};  label.tWw30 = {'time since birth', 'wet weight', '30 C'};  
temp.tWw30    = C2K(30);  units.temp.tWw30 = 'K'; label.temp.tWw30 = 'temperature';
bibkey.tWw30 = 'RautRahm1992';
%
data.tWw25 = [ ... % age (d), wet weight (g)
0.985	0.011
28.563	0.018
55.648	0.139
83.719	0.210
112.774	0.284
126.070	0.285];
units.tWw25   = {'d', 'g'};  label.tWw25 = {'time since birth', 'wet weight', '25 C'};  
temp.tWw25    = C2K(25);  units.temp.tWw25 = 'K'; label.temp.tWw25 = 'temperature';
bibkey.tWw25 = 'RautRahm1992';
%
data.tWw20 = [ ... % age (d), wet weight (g)
0.006	0.004
27.699	0.018
55.378	0.065
83.040	0.132
111.213	0.178
138.403	0.218
166.618	0.215
189.377	0.226];
units.tWw20   = {'d', 'g'};  label.tWw20 = {'time since birth', 'wet weight', '20 C'};  
temp.tWw20    = C2K(20);  units.temp.tWw20 = 'K'; label.temp.tWw20 = 'temperature';
bibkey.tWw20 = 'RautRahm1992';

%% set weights for all real data
weights = setweights(data, []);
weights.Lb = 5 * weights.Lb;
weights.Lp = 5 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 3 * weights.psd.p_M;
%weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
%txtData.comment = comment;

%% Group plots
set1 = {'tL35','tL30','tL25','tL20'}; subtitle1 = {'Data for 35, 30, 25, 20 C'};
set2 = {'tWw35','tWw30','tWw25','tWw20'}; subtitle2 = {'Data for 35, 30, 25, 20 C'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Facts
F1 = 'Simultaneous hermaprodite';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3PNJB'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '4805927'; % Ency of Life
metaData.links.id_Wiki = 'Indoplanorbis_exustus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '1686890'; % Taxonomicon
metaData.links.id_WoRMS = '716351'; % WoRMS
metaData.links.id_molluscabase = '716351'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Indoplanorbis_exustus}}';
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
bibkey = 'RautRahm1992'; type = 'Article'; bib = [ ... 
'author = {S. K. Raut and M. S. Rahman and S. K. Samanta}, ' ... 
'title = {Influence of temperature on survival, growth and fecundity of the freshwater snail \emph{Indoplanorbis exustus ({D}eshayes)}}, ' ...
'journal = {Mem. Inst. Oswaldo Cruz, Rio de Janeiro}, ' ...
'volume = {87(1)}, ' ...
'year = {1992}, ' ...
'pages = {15-19}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

