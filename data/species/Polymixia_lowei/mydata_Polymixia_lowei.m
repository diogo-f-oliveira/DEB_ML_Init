function [data, auxData, metaData, txtData, weights] = mydata_Polymixia_lowei

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Polymixiiformes'; 
metaData.family     = 'Polymixiidae';
metaData.species    = 'Polymixia_lowei'; 
metaData.species_en = 'Beardfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13.4); % K, body temp
metaData.data_0     = { 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2025 02 21]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 21];

%% set data
% zero-variate data

data.am = 14*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(13.4); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 15;  units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for females'; bibkey.Lp  = 'guess'; 
data.Li  = 29.4;  units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp  = 39.4; units.Wwp  = 'g';	label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = 'fishbase'; 
  comment.Wwp = 'based on 0.01047*Lp^3.04, see F1';
data.Wwi  = 304.6; units.Wwi  = 'g';	label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'fishbase'; 
  comment.Wwi = 'based on 0.01047*Li^3.04, see F1';

data.GSI  = 0.02; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI = 'guess';   
  temp.GSI = C2K(13.4); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Polymixia_nobilis';
 
% uni-variate data
% time-length
data.tL = [  ... % time since birth (yr), fork length (cm)
0.042	9.307
0.059	7.795
0.059	8.220
1.024	8.835
1.024	9.213
1.041	8.315
1.079	10.772
1.097	10.913
1.098	11.811
1.133	9.827
1.934	10.961
1.970	10.583
1.990	13.701
2.007	12.236
2.008	12.850
2.009	15.213
2.010	16.819
2.027	14.173
2.028	16.016
2.045	14.598
2.062	11.717
2.064	15.543
2.956	17.764
2.973	15.638
2.975	19.134
2.990	12.898
2.991	14.457
2.991	15.402
2.992	17.055
2.992	17.339
2.994	20.504
2.996	23.764
3.008	13.843
3.009	14.787
3.010	15.969
3.010	16.583
3.010	16.866
3.012	20.173
3.029	18.000
3.030	19.370
3.046	16.346
3.938	17.858
3.956	16.961
3.956	17.197
3.956	17.433
3.957	18.945
3.973	15.543
3.974	16.630
3.975	19.417
3.977	22.866
3.978	24.047
3.992	16.394
3.993	18.709
3.994	20.504
3.994	20.740
3.996	23.764
3.997	24.803
3.997	25.606
4.012	19.795
4.014	22.583
4.031	21.591
4.031	21.827
4.046	15.874
4.993	19.039
4.994	19.323
4.995	22.252
4.996	23.433
5.010	16.630
5.011	18.425
5.011	18.661
5.011	18.756
5.012	19.512
5.012	19.843
5.012	20.126
5.013	21.921
5.014	22.772
5.014	23.811
5.015	24.094
5.015	24.378
5.028	15.732
5.031	21.071
5.031	21.402
5.031	21.543
5.033	24.756
5.033	25.276
5.049	20.740
5.050	21.780
5.066	18.142
5.886	21.638
5.886	22.157
5.905	22.724
5.905	23.008
5.906	25.465
5.922	20.976
5.922	21.307
5.923	23.717
5.925	25.843
5.925	26.173
5.940	20.409
5.940	20.693
5.942	24.094
5.942	24.378
5.943	25.228
5.957	18.756
5.960	24.803
5.976	19.890
6.923	23.480
6.959	22.394
6.961	25.795
6.977	21.685
6.995	21.402
6.995	22.016
6.996	23.055
6.996	23.953
6.997	24.756
6.997	25.370
7.000	29.244
7.995	22.488
8.031	21.827
8.032	23.244
8.035	27.213]; 
data.tL(:,1) = 365 * (0.8 + data.tL(:,1)); % convert yr to d
n=size(data.tL,1); for i=2:n; if data.tL(i,1)<=data.tL(i-1,1); data.tL(i,1)=data.tL(i-1,1)+1e-3; end; end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(13.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'VazdRoss2019';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01047*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4LBFG'; % Cat of Life
metaData.links.id_ITIS = '166126'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Polymixia'; % Wikipedia
metaData.links.id_ADW = 'Polymixia_lowei'; % ADW
metaData.links.id_Taxo = '184374'; % Taxonomicon
metaData.links.id_WoRMS = '158923'; % WoRMS
metaData.links.id_fishbase = 'Polymixia-lowei'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Polymixia}}';
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
bibkey = 'VazdRoss2019'; type = 'techreport'; bib = [ ... 
'author = {Andr\''{e} Martins Vaz-dos-Santos and Carmen L\''{u}cia Del Bianco Rossi-Wongtschowski}, '...
'year = {2019}, ' ...
'title = {Growth in fisheries resources from the {S}outhwestern {A}tlantic}, ' ...
'institution = {Instituto Oceanogr\''{a}fico – USP S\~{a}o Paulo}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Polymixia-lowei}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

