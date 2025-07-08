function [data, auxData, metaData, txtData, weights] = mydata_Conus_pennaceus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Neogastropoda'; 
metaData.family     = 'Conidae';
metaData.species    = 'Conus_pennaceus'; 
metaData.species_en = 'Feathered cone';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIN','MPSW'};
metaData.ecoCode.habitat = {'0iMb'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'; 't-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 04 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 04 30]; 

%% set data
% zero-variate data

data.am = 15*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.13;    units.Lb  = 'cm';  label.Lb  = 'shell length at birth'; bibkey.Lb  = 'Perr1983';
data.Lp  = 2.25;    units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'Perr1983';
  comment.Lp = '20-25 mm';
data.Li  = 5.0;    units.Li  = 'cm';  label.Li  = 'ultimate shell length'; bibkey.Li  = 'Perr1983';

data.Wwi = 26.9;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'EoL';
 
% uni-variate data
% length - change in length
data.LdL = [ ... % shell length (cm), chane in shell length (cm/yr)    
    0.7 1.10
    0.9 1.25
    1.1 1.36
    1.3 1.18
    1.5 1.11
    1.7 0.99
    1.9 0.79
    2.1 0.75
    2.3 0.69
    2.5 0.72
    2.7 0.65
    2.9 0.37
    3.1 0.35
    3.3 0.42
    3.5 0.26
    3.7 0.41
    3.9 0.46
    4.1 0.32
    4.3 0.30
    4.5 0.48
    4.7 0.20
    4.9 0.35
    5.5 0.23];
data.LdL(:,2) = data.LdL(:,2)/ 365; % convert cm/yr to cm/d
units.LdL   = {'cm', 'cm/d'};  label.LdL = {'shell length', 'change in shell length'};  
temp.LdL    = C2K(27.5);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'Perr1983';
comment.LdL = 'Temperature ranges from 8.4 to 20.8 C';

% time - yearly fecundity
data.tN = [ ... % time since birth (yr), yearly fecundity (#)
1.590	928.768
1.665	1129.800
1.741	975.617
1.861	837.034
1.861	1006.919
1.891	1068.800
1.936	713.740
1.937	960.846
1.951	821.901
2.013	1378.096
2.042	1115.649
2.043	1486.308
2.058	1223.810
2.134	1625.616
2.162	760.849
2.178	1239.668
2.208	1131.663
2.224	1409.708
2.299	1348.191
2.299	1502.632
2.315	1610.792
2.329	1240.185
2.330	1966.059
2.344	1456.455
2.405	1672.879
2.435	1364.100
2.436	1935.533
2.450	1472.261
2.465	1147.986
2.480	1534.141
2.526	1688.737
2.585	1333.730
2.586	1457.283
2.616	1488.274
2.617	2044.263
2.662	1704.647
2.691	1241.427
2.737	1874.791
2.768	2091.112
2.797	1705.112
2.797	1782.333
2.842	1581.715
2.845	2971.686
2.858	2184.087
2.888	1983.417
2.979	2091.836
3.009	1968.387
3.038	1443.391
3.085	2447.414
3.145	2092.406
3.147	3065.385
3.148	3636.817
3.161	2818.331
3.191	2555.884
3.236	2432.486
3.282	2895.965
3.312	3004.178
3.340	1815.084
3.432	2355.939
3.449	3498.855
3.464	3746.012
3.539	3221.171
3.553	2696.123
3.582	2356.456
3.841	3361.203
3.854	2697.158
3.961	3531.502
3.962	3871.273
4.021	2991.165
4.064	1771.235
4.080	2574.381
4.172	3053.459
4.190	4829.584
4.276	2281.615
4.337	2806.922
4.339	3918.899
4.444	3533.158
4.444	3687.599
4.503	2900.156
4.564	3209.245
4.686	4213.527
4.763	4707.997
4.775	3148.193
4.942	4090.854
4.971	3087.090
4.989	4924.991
5.289	4261.929
5.458	5776.021
5.985	5484.394
6.059	4712.447
6.165	5052.579
6.541	4667.770
7.464	6261.670
7.480	6524.272
7.735	6216.269
8.231	5044.224
8.824	8057.844
9.225	4754.200
9.442	7859.192
9.906	6131.055
9.952	6609.977];
data.tN(:,1) = data.tN(:,1) * 365;
units.tN   = {'d', '#'};  label.tN = {'time since birth', 'yearly fecundity'};  
temp.tN    = C2K(27.5);  units.temp.tN = 'K'; label.temp.tN = 'temperature';
bibkey.tN = 'Perr1983';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL = 10 * weights.LdL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = ''; label.psd.k = 'maintenance ratio';

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed to equal the preffered temperature as given by sealifebase';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'No planktonic stage';
metaData.bibkey.F1 = 'Perr1983'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'XY26'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46454220'; % Ency of Life
metaData.links.id_Wiki = 'Conus_pennaceus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3950874'; % Taxonomicon
metaData.links.id_WoRMS = '215500'; % WoRMS
metaData.links.id_molluscabase = '215500'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Conus_pennaceus}}';
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
bibkey = 'Perr1983'; type = 'Article'; bib = [ ... 
'author = {Frank E. Perron}, ' ... 
'year = {1983}, ' ...
'title = {Growth, Fecundity, and Mortality of \emph{Conus pennaceus} in {H}awaii}, ' ...
'journal = {Ecology}, ' ...
'volume = {64(1)}, ' ...
'pages = {53-62}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Conus-pennaceus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/46454220}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

