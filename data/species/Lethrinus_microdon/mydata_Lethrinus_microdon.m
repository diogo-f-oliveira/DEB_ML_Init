function [data, auxData, metaData, txtData, weights] = mydata_Lethrinus_microdon
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Lethrinidae';
metaData.species    = 'Lethrinus_microdon'; 
metaData.species_en = 'Smalltooth emperor'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MINE'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.1); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 21];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 21];

%% set data
% zero-variate data

data.am = 15*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(28.1);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp  = 29.1; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 80;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'GomaSiju2021';
  comment.Wwb = 'based egg diameter of 0.7 mm of Lethrinus_lentjan: pi/6*0.07^3'; 
data.Wwp = 261.7;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01175*Lp^2.97, see F1';
data.Wwi = 5275;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01175*Li^2.97, see F1';

data.Ri  = 227e3/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate';   bibkey.Ri  = 'DegoAli2013';   
  temp.Ri = C2K(28.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'value for L. mahsena; size is not specified';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
0.990	23.166
0.990	23.881
1.002	21.797
1.014	20.964
1.014	21.440
1.014	22.512
1.015	24.536
1.016	26.976
1.041	29.357
1.049	16.977
1.985	23.535
1.985	24.071
1.986	25.976
1.997	20.738
1.998	24.666
1.998	25.202
1.999	27.405
1.999	28.774
2.009	22.405
2.011	27.881
2.011	29.429
2.012	29.726
2.012	29.905
2.012	30.381
2.013	32.881
2.021	19.250
2.021	20.322
2.021	21.095
2.023	27.107
2.024	31.631
2.034	22.822
2.035	26.691
2.036	30.738
2.049	32.048
2.050	34.489
2.980	21.702
2.980	23.309
2.982	30.571
2.982	30.928
2.983	31.345
2.983	33.369
2.995	30.452
2.995	31.762
3.005	24.202
3.006	26.167
3.007	32.417
3.008	32.774
3.016	21.464
3.017	22.238
3.018	26.643
3.019	28.667
3.020	33.964
3.043	27.238
3.043	27.655
3.988	26.595
3.989	26.893
4.014	29.571
4.014	30.941
4.016	36.476
4.026	30.226
4.039	32.310
4.051	28.798
4.052	33.798
4.998	33.155
5.047	32.262
6.005	31.381
6.030	34.655
6.031	35.786
6.054	30.786
6.988	34.190
9.000	25.345];
data.tL_f(:,1) = 365 * (0.9+data.tL_f(:,1));  % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length','females'};  
temp.tL_f    = C2K(28.1);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GranAlAb2010';
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
1.038	19.715
1.039	22.572
1.039	22.988
1.065	26.620
1.996	20.678
1.999	27.524
2.009	21.571
2.009	22.821
2.010	23.893
2.021	19.845
2.022	23.357
2.023	28.476
2.024	30.917
2.035	24.726
2.047	26.155
2.048	29.072
2.057	18.953
3.004	20.988
3.006	27.119
3.019	30.095
3.030	24.917
3.031	28.369
3.041	20.393
3.066	22.953
3.977	29.869
3.978	33.262
3.988	24.690
3.989	28.559
3.990	31.952
3.990	32.607
4.012	22.369
4.024	23.441
4.025	24.036
4.026	27.548
4.075	29.453
5.011	37.024
5.021	28.393
5.022	30.298
5.033	26.191
5.035	35.000
5.047	32.143
5.993	33.821
6.003	26.440
6.028	27.572
6.041	28.465
7.013	34.845
7.024	31.095
7.027	39.012
7.036	30.143
7.050	33.358
8.008	33.250
8.008	34.202
8.056	29.798];
data.tL_m(:,1) = 365 * (0.9 + data.tL_m(:,1));  % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length','males'};  
temp.tL_m    = C2K(28.1);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'GranAlAb2010';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 3 * weights.Li;
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
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww ing g = 0.01175*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'protogynous hermaphrodite';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6Q2Q9'; % Cat of Life
metaData.links.id_ITIS = '169155'; % ITIS
metaData.links.id_EoL = '46580944'; % Ency of Life
metaData.links.id_Wiki = 'Lethrinus_microdon'; % Wikipedia
metaData.links.id_ADW = 'Lethrinus_microdon'; % ADW
metaData.links.id_Taxo = '178744'; % Taxonomicon
metaData.links.id_WoRMS = '212071'; % WoRMS
metaData.links.id_fishbase = 'Lethrinus-microdon'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lethrinus_microdon}}';
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
bibkey = 'GranAlAb2010'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1439-0426.2009.01380.x}, ' ...
'author = {Grandcourt, E. and Al Abdessalaam, T. Z. and Francis, F. and Al Shamsi, A.}, ' ... 
'year = {2010}, ' ...
'title = {Age-based life history parameters and status assessments of by-catch species (\emph{Lethrinus borbonicus}, \emph{Lethrinus microdon}, \emph{Pomacanthus maculosus} and \emph{Scolopsis taeniatus}) in the southern {A}rabian {G}ulf}, ' ...
'journal = {Journal of Applied Ichthyology}, ' ...
'volume = {26(3)}, ' ...
'pages = {381–389}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GomaSiju2021'; type = 'Article'; bib = [ ... 
'doi = {10.1111/are.15461}, ' ...
'author = {Pitchaimuthu Gomathi and Ramachandran Siju and Mathavankonathu Kuttan Anil and Gopidas P. Ambarish and Sumathi Surya and Bhargavan Raju and Padikkala Kandiyil Raheem and Boby Ignatius and Achamveettil Gopalakrishnan}, ' ... 
'year = {2021}, ' ...
'title = {Embryonic and larval development of Pink ear emperor, \emph{Lethrinus lentjan} ({L}acepede, 1802) under captive conditions}, ' ...
'journal = {Aquaculture Research}, ' ...
'volume = {52}, ' ...
'pages = {5857–5869}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DegoAli2013'; type = 'Article'; bib = [ ... 
'author = {A. S. O. Abu Degoon and S. M. Ali}, ' ... 
'year = {2013}, ' ...
'title = {On some reproductive aspects of the Sky Emperor, \emph{Lethrinus mahsena} ({P}ieces) in the {S}udanese {R}ed {S}ea}, ' ...
'journal = {SJBS (B)}, ' ...
'volume = {17}, ' ...
'pages = {51-62}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Lethrinus-microdon.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
