function [data, auxData, metaData, txtData, weights] = mydata_Papio_anubis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Cercopithecidae';
metaData.species    = 'Papio_anubis'; 
metaData.species_en = 'Olive baboon'; 

metaData.ecoCode.climate = {'Aw','BSh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 12 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 12 29]; 

%% set data
% zero-variate data

data.tg = 180;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'ADW';   
  temp.tg = C2K(38);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 420;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'ADW';   
  temp.tx = C2K(38);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 5*365;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';
  temp.tp = C2K(38);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 37.5*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'ADW';   
  temp.am = C2K(38);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 976;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'SiggStol1982';
data.Wwi = 14700;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'Wiki';
data.Wwim = 24000; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';  bibkey.Wwim = 'Wiki';

data.Ri  = 1/568;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(38);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-weight
data.tWw_f = [ ... % time since birth (yr), wet weight (g)
0.000	976.058
0.521	1688.712
0.940	2097.422
1.006	1829.926
1.040	2400.885
1.040	2501.557
1.090	2032.475
1.241	2068.200
1.511	4018.386
2.080	4563.494
2.499	4603.072
2.515	3630.147
2.515	4133.509
2.666	4538.366
2.985	5012.746
3.086	5584.668
3.119	4578.426
3.153	5015.155
3.521	5054.011
3.991	6033.920
4.041	5564.838
4.091	6068.923
4.593	5606.344
4.594	6478.837
5.482	7062.079
6.003	9116.549
6.187	9119.199
6.489	10130.257
7.496	12057.483];
data.tWw_f(:,1) = data.tWw_f(:,1) * 365;
units.tWw_f  = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f   = C2K(37.3);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'SiggStol1982';
comment.tWw_f = 'Data for females; data for P. anubis, P. cynocephalus and their hybrids';
%
data.tWw_m = [ ... % time since birth (yr), wet weight (g)
0.018	976.780
0.185	1214.091
0.504	1487.126
0.537	1051.361
1.543	2575.897
2.029	3119.801
2.046	4059.650
2.533	4771.341
2.985	5516.108
3.035	4476.549
3.992	7980.252
4.510	5705.812
4.527	6578.546
5.031	8162.972
7.470	21117.513
7.483	17124.417
7.486	20111.030];
data.tWw_m(:,1) = data.tWw_m(:,1) * 365;
units.tWw_m  = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m   = C2K(37.3);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'SiggStol1982';
comment.tWw_m = 'Data for males; data for P. anubis, P. cynocephalus and their hybrids';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only, with an increase at puberty';
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
D3 = 'mod_3: tWw data added, Li removed';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '6TM9B'; % Cat of Life
metaData.links.id_ITIS = '944211'; % ITIS
metaData.links.id_EoL = '2925214'; % Ency of Life
metaData.links.id_Wiki = 'Papio_anubis'; % Wikipedia
metaData.links.id_ADW = 'Papio_anubis'; % ADW
metaData.links.id_Taxo = '65964'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100581'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Papio_anubis}}';
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
bibkey = 'SiggStol1982'; type = 'Article'; bib = [ ... 
'doi = {10.1159/000155842}, ' ...
'author = {H. Sigg and A. Stolba and J.-J. Abegglen and V. Dasser}, ' ... 
'year = {1982}, ' ...
'title = {Life History of Hamadryas Baboons: {P}hysical Development, Infant Mortality, Reproductive Parameters and Family Relationships}, ' ...
'journal = {Primates}, ' ...
'volume = {23(4)}, ' ...
'pages = {473-487}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Papio_anubis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

