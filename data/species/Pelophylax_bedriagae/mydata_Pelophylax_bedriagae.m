function [data, auxData, metaData, txtData, weights] = mydata_Pelophylax_bedriagae

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Pelophylax_bedriagae'; 
metaData.species_en = 'Levant water frog'; 

metaData.ecoCode.climate = {'BWh', 'BSk', 'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf', 'jiTi'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 06 12];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 12]; 

%% set data
% zero-variate data

data.ab = 8;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Gunt1990';   
  temp.ab = C2K(22);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 2*365; units.tp = 'd';    label.tp = 'time since metam at puberty for females'; bibkey.tp = 'BaskUlub2018';
  temp.tp = C2K(22);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2*365;units.tpm = 'd';   label.tpm = 'time since metam at puberty for males'; bibkey.tpm = 'BaskUlub2018';
  temp.tpm = C2K(22); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 12*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'BaskUlub2018';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1.9;  units.Lj  = 'cm';  label.Lj  = 'SVL at metam';    bibkey.Lj  = 'Gunt1990'; 
data.Lp  = 5.8;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty'; bibkey.Lp  = 'Gunt1990';
  comment.Lp = 'based on (Wwp/Wwi)^(1/3)*Li';
data.Li  = 10.2;  units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'BaskUlub2018';
data.Lim = 8.4;  units.Lim  = 'cm'; label.Lim  = 'ultimate SVL';           bibkey.Lim  = 'BaskUlub2018';
  comment.Wwi = 'based on remark that males are slightly smaller than females';

data.Wwb = 6.3e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Gunt1990';
  comment.Wwb = 'based on drawing: pi/6*0.2^3';
data.Wwj = 0.7;  units.Wwj = 'g';   label.Wwj = 'wet weight at metam';     bibkey.Wwj = 'Gunt1990';
  comment.Wwj = 'based on (Lj/Li)^3*Wwi';
data.Wwp = 20;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Gunt1990';
data.Wwi = 108; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Pelophylax_esculentus (10.2/9.5)^3*87.5';

data.Ri = 5e3/365; units.Ri = '#/d';    label.Ri = 'max reproduction rate';     bibkey.Ri = 'Gunt1990';   
  temp.Ri = C2K(22);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length
data.tL_f = [ ... % time since metam (d), SVL (cm)
0.043	2.434
0.063	2.341
0.063	2.619
0.064	3.019
0.084	3.235
1.959	6.104
1.978	5.642
1.979	5.950
1.980	7.090
1.997	4.841
1.997	5.242
2.965	6.723
3.024	6.969
3.989	6.571
3.990	7.711
4.011	8.173
4.011	8.389
4.028	6.479
4.049	7.033
4.108	7.465
4.995	7.991
5.014	7.559
5.053	6.943
5.053	7.251
5.921	7.623
5.921	7.839
5.921	8.085
5.940	7.469
5.981	8.578
6.986	8.519
7.004	7.749
7.005	8.242
7.024	7.687
7.024	7.965
7.951	8.460
7.970	7.936
7.989	7.628
7.989	8.059
7.990	8.244
8.012	9.600
8.050	9.076
9.016	9.417
9.962	9.635
10.022	10.251
11.991	10.348
11.992	10.564];
data.tL_f(:,1) = (data.tL_f(:,1) + .5) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since metam', 'SVL', 'female'};  
temp.tL_f    = C2K(22);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'BaskUlub2018';
comment.tL_f = 'Data for females at Denizli, Turkey';
%
data.tL_m = [ ... % time since metam (d), SVL (cm)
0.062	2.126
0.064	3.204
0.102	2.280
0.102	2.496
0.103	2.896
1.976	4.317
1.976	4.472
1.977	4.995
2.017	5.365
2.986	7.708
3.001	4.936
3.002	5.090
3.002	5.491
3.002	5.583
3.003	5.737
3.003	5.860
3.003	6.230
3.969	6.355
4.010	7.310
4.027	5.585
4.027	5.801
4.027	6.078
4.028	6.664
4.974	6.666
4.974	6.974
4.975	7.190
4.992	5.526
5.034	7.652
5.035	7.991
5.052	6.111
5.979	6.884
5.979	7.099
5.979	7.315
5.997	6.052
6.016	5.436
6.017	6.453
6.018	6.637
6.964	7.102
6.964	7.441
7.006	8.765
7.021	6.178
7.022	6.486
7.967	5.903
7.967	6.303
7.987	6.611
7.988	7.012
7.989	7.967
7.990	8.152
8.974	8.092
8.992	6.983
8.993	7.230
10.018	7.972
11.004	8.374
11.004	8.436
11.022	7.604
11.023	7.851
11.024	8.559
11.990	9.393];
data.tL_m(:,1) = (data.tL_m(:,1) + .5) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since metam', 'SVL', 'male'};  
temp.tL_m    = C2K(22);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'BaskUlub2018';
comment.tL_m = 'Data for males at Denizli, Turkey';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

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

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'temperatures are guessed';
D3 = 'Reference to Gunt1990 concerns Pelophylax_esculentus';
metaData.discussion = struct('D1', D1,'D2', D2, 'D3', D3);

%% Facts
% F1 = '';
% metaData.bibkey.F1 = 'Wiki'; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '76CJ2'; % Cat of Life
metaData.links.id_ITIS = '775178'; % ITIS
metaData.links.id_EoL = '1019741'; % Ency of Life
metaData.links.id_Wiki = 'Pelophylax_bedriagae'; % Wikipedia
metaData.links.id_ADW = 'Pelophylax_bedriagae'; % ADW
metaData.links.id_Taxo = '996595'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Pelophylax+bedriagae'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pelophylax_bedriagae}}';
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
bibkey = 'BaskUlub2018'; type = 'Article'; bib = [ ... 
'doi = {10.13128/Acta_Herpetol-21026}, ' ...
'author = {Eyup Ba\c{s}kale and Sevay Ay\c{s}e Ulubeli and Yakup Kaska}, ' ... 
'year = {2018}, ' ...
'title = {Age structures and growth parameters of the Levantine frog, \emph{Pelophylax bedriagae}, at different localities in {D}enizli, {T}urkey}, ' ...
'journal = {Acta Herpetologica}, ' ...
'volume = {13(2)}, ' ...
'pages = {147-154}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gunt1990'; type = 'Book'; bib = [ ...  
'author = {G\"{u}nther, R.}, ' ...
'year = {1990}, ' ...
'title  = {Die Wasserfr\"{o}sche Europas}, ' ...
'publisher = {A. Ziemsen Verlag}, ' ...
'sereis = {Die Neue Brehm Buecherei}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

