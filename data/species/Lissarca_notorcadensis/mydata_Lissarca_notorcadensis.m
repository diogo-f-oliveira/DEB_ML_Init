function [data, auxData, metaData, txtData, weights] = mydata_Lissarca_notorcadensis

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Arcida'; 
metaData.family     = 'Philobryidae';
metaData.species    = 'Lissarca_notorcadensis'; 
metaData.species_en = 'Bivalve'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 23]; 

%% set data
% zero-variate data

data.am = 20*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'BreyHain1992';   
  temp.am = C2K(2);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'mean temparature is guessed';
  
data.Lj  = 0.0513; units.Lj  = 'cm';  label.Lj  = 'shell length at metam'; bibkey.Lj  = 'BreyHain1992';
data.Lp  = 0.38; units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'BreyHain1992';
data.Li  = 0.8;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'EoL';

data.Wwb = 5.72e-6; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'BreyHain1992';
  comment.Wwb = 'based on egg diameter of 254 mum: pi/9*0.0254^3'; 
data.Wdi = 37e-4; units.Wdi = 'g';   label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'BreyHain1992';
  comment.Wdi = 'based on 18e-6*(10*Li)^2.567, see F1';

data.Ri  = 57/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate for assumed SL 3 cm'; bibkey.Ri  = 'BreyHain1992';   
  temp.Ri = C2K(2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on -8.414+17.655e3*Wwd';

% uni-variate data

% time-length 
data.tLS = [ ... % time since settlement (a), shell length  (cm)
0.085	0.116
0.146	0.147
1.034	0.234
1.037	0.207
1.039	0.184
1.040	0.176
1.044	0.133
2.050	0.325
2.052	0.305
2.092	0.222
2.112	0.355
2.113	0.340
2.979	0.325
3.010	0.342
3.011	0.332
3.130	0.427
3.165	0.388
3.167	0.369
4.050	0.518
4.057	0.439
4.059	0.423
4.103	0.292
4.120	0.454
5.102	0.562
5.104	0.543
5.106	0.530
5.107	0.514
5.115	0.429
5.130	0.609
5.143	0.470
6.009	0.462
6.020	0.674
6.065	0.543
6.090	0.615
6.126	0.578
6.160	0.557
6.989	0.590
7.055	0.572
7.059	0.536
7.109	0.680
7.120	0.564
8.050	0.551
8.072	0.651
8.074	0.630
8.078	0.594
8.079	0.586
9.064	0.663
9.065	0.652
9.071	0.596
10.090	0.652
10.114	0.733
11.070	0.789
11.083	0.658
12.005	0.719
12.074	0.677
16.048	0.977];
data.tLS(:,1) = data.tLS(:,1) * 365; % convert yr to d
units.tLS   = {'cm', 'cm'};  label.tLS = {'time since settlement', 'shell length'};  
temp.tLS    = C2K(2);  units.temp.tLS = 'K'; label.temp.tLS = 'temperature';
bibkey.tLS = 'BreyHain1992';
comment.tLS = 'Southern stations (more than 70 S)';
%
data.tLN = [ ... % time since settlement (a), shell length  (cm)
0.965	0.292
1.038	0.197
1.063	0.272
1.098	0.236
2.084	0.307
2.086	0.288
2.115	0.321
3.036	0.406
3.045	0.309
4.081	0.529
4.093	0.404
4.094	0.392
5.197	0.580
6.024	0.638
6.072	0.468
6.126	0.574
7.053	0.595
7.080	0.646
7.083	0.611
8.092	0.785
8.095	0.752
8.145	0.565
9.084	0.789
9.086	0.773
10.047	0.773
10.112	0.754
10.116	0.719
11.037	0.795
13.087	0.801];
data.tLN(:,1) = data.tLN(:,1) * 365; % convert yr to d
units.tLN   = {'cm', 'cm'};  label.tLN = {'time since settlement', 'shell length'};  
temp.tLN    = C2K(2);  units.temp.tLN = 'K'; label.temp.tLN = 'temperature';
bibkey.tLN = 'BreyHain1992';
comment.tLN = 'Northern stations (less than 63 S)';

%% set weights for all real data
weights = setweights(data, []);
weights.tLS = 5 * weights.tLS;
weights.tLN = 5 * weights.tLN;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tLN','tLS'}; subtitle1 = {'Data from northern, southern stations'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'length-weight: AFDM (mg) = 0.018 * (SL in mm)^2.567';
metaData.bibkey.F1 = 'BreyHain1992'; 
F2 = 'Embryos are brooded in mantle';
metaData.bibkey.F2 = 'BreyHain1992'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6QJD6'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46466475'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3964134'; % Taxonomicon
metaData.links.id_WoRMS = '197241'; % WoRMS
metaData.links.id_molluscabase = '197241'; % molluscabase

%% References
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/46466475}}';
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
bibkey = 'BreyHain1992'; type = 'Article'; bib = [ ... 
'author = {Thomas Brey and Stefan Hain}, ' ... 
'year = {1992}, ' ...
'title = {Growth, reproduction and production of \emph{Lissarca notorcadensis} ({B}ivalvia: {P}hilobryidae) in the {W}eddell {S}ea, {A}ntarctica}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {82}, ' ...
'pages = {219-226}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
