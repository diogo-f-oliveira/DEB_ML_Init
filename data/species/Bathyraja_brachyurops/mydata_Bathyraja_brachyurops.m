function [data, auxData, metaData, txtData, weights] = mydata_Bathyraja_brachyurops

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Arhynchobatidae';
metaData.species    = 'Bathyraja_brachyurops'; 
metaData.species_en = 'Broadnose skate'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0iMb'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 07];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};  

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 11 07]; 

%% set data
% zero-variate data;
data.ab = 21*30.5;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on v = 0.032 cm/d, as is typical for Bathyraja';
data.am = 13*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'Buck2006';   
  temp.am = C2K(6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 20.9;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'guess';
  comment.Lb = 'based on 0.18*Li, as typical for Bathyraja';
data.Lp = 75;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Buck2006';
  comment.Lp = 'based on tp 10 yr and tL data';
data.Li  = 116;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Buck2006'; 

data.Wwi = 14.2e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.00490*Li^3.13, see F1'; 

data.Ri  = 14.5/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.65, as is typical for Bathyraja';

% uni-variate data
% time - length
data.tL_f = [ ... % time since birth (yr), total length (cm)
1.547	26.155
1.996	29.801
2.955	33.458
2.959	39.519
2.960	41.034
2.961	42.246
2.964	47.095
4.048	46.512
4.049	48.027
4.052	53.482
4.082	49.846
4.082	50.755
4.943	50.471
5.008	51.987
5.009	54.109
5.010	55.927
5.013	60.169
5.043	57.746
6.031	55.343
6.034	60.191
6.036	63.525
6.037	65.949
6.061	53.222
6.070	67.465
6.090	49.283
6.092	51.708
6.960	62.939
6.961	64.151
6.962	65.969
6.963	68.090
6.974	83.848
7.062	72.941
7.064	75.062
8.056	80.235
8.057	82.053
8.058	84.175
8.059	85.993
8.142	65.085
8.145	70.843
8.146	72.661
8.149	76.601
8.921	87.830
8.981	81.467
8.983	84.498
9.008	74.195
9.010	76.922
9.011	78.438
9.039	71.469
10.061	74.824
10.063	78.460
10.064	79.976
10.066	83.006
10.068	84.824
10.951	70.601
10.994	87.268
10.996	89.996
12.045	85.473
12.046	86.382
12.047	88.200
12.048	90.625
13.069	91.253];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(6); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Buck2006'; 
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.919	27.595
2.923	41.578
2.953	37.639
3.951	38.570
3.952	40.085
3.954	43.418
3.964	58.570
3.988	46.449
3.989	47.358
3.991	50.995
3.992	52.510
4.954	46.773
4.955	47.682
4.959	54.652
4.961	57.379
4.995	60.410
5.032	67.381
5.898	63.157
5.960	59.219
5.961	61.643
6.018	49.524
6.018	50.130
6.019	51.948
6.022	55.281
6.096	70.737
6.893	58.633
6.921	52.573
6.924	56.513
6.927	61.361
6.928	63.483
6.951	48.938
6.963	68.029
6.964	68.938
6.966	72.877
6.969	77.726
6.995	66.817
7.956	60.172
7.967	77.444
7.990	63.203
7.992	66.233
7.993	68.354
8.059	69.871
8.060	72.598
8.062	74.719
8.092	71.387
8.927	69.586
8.928	70.496
8.929	72.314
8.954	61.102
8.964	76.860
8.966	80.193
9.000	82.315
9.001	83.224
9.991	71.731
9.992	73.246
12.025	82.381];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to 
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Buck2006'; 
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.ab = 0 * weights.ab;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Grouping
set1 = {'tL_f','tL_m'}; subtitle1 = 'Data for females, males';
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males and females are assumed not to differ';
D2 = 'temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00372*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '68DZP'; % Cat of Life
metaData.links.id_ITIS = '564246'; % ITIS
metaData.links.id_EoL = '46560758'; % Ency of Life
metaData.links.id_Wiki = 'Bathyraja_brachyurops'; % Wikipedia
metaData.links.id_ADW = 'Bathyraja_brachyurops'; % ADW
metaData.links.id_Taxo = '163704'; % Taxonomicon
metaData.links.id_WoRMS = '271509'; % WoRMS
metaData.links.id_fishbase = 'Bathyraja-brachyurops'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bathyraja_brachyurops}}';  
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
bibkey = 'Buck2006'; type = 'phdthesis'; bib = [ ...
'author = {Amelie B\"{u}cker}, ' ...
'year = {2006}, ' ...
'title  = {Age and growth of skates of the genus \emph{Bathyraja} in Argentina}, ' ...
'school = {University of Bremen}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Bathyraja-brachyurops.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/46560754}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
