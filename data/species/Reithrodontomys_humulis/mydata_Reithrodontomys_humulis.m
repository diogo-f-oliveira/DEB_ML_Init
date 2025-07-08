function [data, auxData, metaData, txtData, weights] = mydata_Zygodontomys_brevicauda
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Reithrodontomys_humulis'; 
metaData.species_en = 'Eastern harvest mouse'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg','0iFm'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.2); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 14];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2021 11 14];              

%% set data
% zero-variate data

data.tg = 23;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.2);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 23;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';   
  comment.tx = '9-11 d';
data.tp = 105;  units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36.2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 2.2*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 1.115;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 10.3;     units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'AnAge';

data.Ri  = 8*2.9/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.9 pups per litter; 8 litter per yr assumed (litter interval 32 d)';

 % uni-variate data
% time-weight
data.tWw = [ ... % time since birth (wk), weight (g)
0.000	1.030
0.000	1.121
0.000	1.483
0.000	1.030
0.000	1.211
0.000	1.392
0.000	1.302
0.000	1.121
0.000	1.574
0.000	1.506
0.000	0.895
0.000	0.805
0.000	1.031
0.030	1.291
0.052	1.506
0.052	1.393
0.064	1.212
0.087	1.099
0.110	1.031
0.212	1.031
0.922	2.628
0.946	2.233
0.947	2.120
0.957	2.515
0.957	2.391
0.970	1.939
0.970	1.848
0.982	1.747
1.047	2.618
1.909	2.994
1.919	3.141
1.933	2.451
1.974	3.740
1.976	3.254
2.001	2.542
2.022	3.118
2.056	3.028
2.058	2.417
2.869	4.501
2.926	4.218
2.939	3.732
2.948	4.501
2.971	4.343
3.002	5.225
3.006	4.038
3.030	3.710
3.040	4.207
3.050	4.502
3.164	4.502
3.922	5.138
3.971	3.996
3.978	5.522
3.990	5.285
3.991	4.901
3.992	4.663
3.994	4.109
4.058	5.127
4.999	5.616
4.999	5.515
5.002	4.644
5.009	5.843
5.010	5.718
5.012	5.153
5.026	4.327
5.962	6.106
5.986	5.710
6.006	6.423
6.008	6.004
6.010	5.416
6.023	4.806
6.053	6.140
6.950	5.996
6.963	5.397
6.998	5.295
7.004	6.924
7.006	6.223
7.006	6.109
7.017	6.415
7.077	5.397
7.086	5.985
7.959	6.328
7.973	5.513
7.981	6.509
8.005	6.215
8.005	6.079
8.006	5.921
8.007	5.706
8.042	5.310
8.049	6.498
8.050	6.305
8.053	5.502
8.923	6.580
8.959	6.127
8.992	6.195
9.003	6.489
9.003	6.308
9.006	5.653
9.019	5.132
9.048	6.637
9.049	6.128
9.957	6.233
9.980	6.074
9.993	5.599
9.994	5.475
10.000	7.126
10.001	6.719
10.002	6.448
10.004	5.927
10.006	5.317
10.006	5.091
10.059	6.233];
data.tWw(:,1) = data.tWw(:,1) * 7; % convert wk to d
units.tWw = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw  = C2K(36.3);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Layn1959';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 5 * weights.tWw;
weights.Wwb = 5 * weights.Wwb;
%weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;
weights.psd.v = 10 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '7WPXZ'; % Cat of Life
metaData.links.id_ITIS = '180342'; % ITIS
metaData.links.id_EoL = '328435'; % Ency of Life
metaData.links.id_Wiki = 'Reithrodontomys_humulis'; % Wikipedia
metaData.links.id_ADW = 'Reithrodontomys_humulis'; % ADW
metaData.links.id_Taxo = '62403'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000506'; % MSW3
metaData.links.id_AnAge = 'Reithrodontomys_humulis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Reithrodontomys_humulis}}';
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
bibkey = 'Layn1959'; type = 'Article'; bib = [ ...  
'author = {Layne, James N.}, ' ...
'year = {1959}, ' ...
'title  = {Growth and development of the eastern harvest mouse \emph{Reithrodontomys humilis}}, ' ...
'journal = {Bull. Florida State Mus., Biol. Sci.}, ' ...
'volume = {4}, ' ...
'pages = {61-82}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Reithrodontomys_humulis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

