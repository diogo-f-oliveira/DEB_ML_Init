function [data, auxData, metaData, txtData, weights] = mydata_Modiolus_barbatus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Myida'; 
metaData.family     = 'Mytilidae';
metaData.species    = 'Modiolus_barbatus'; 
metaData.species_en = 'Bearded horsemussel'; 

metaData.ecoCode.climate = {'MC','ME'};
metaData.ecoCode.ecozone = {'MANE','MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wdi'; 'GRi'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 28];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 28]; 

%% set data
% zero-variate data

data.am = 13*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'PehaRich2007';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 3;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Wiki';
data.Li  = 6;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';

data.Wwb = 2.8e-7;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'WongArsh2013';
  comment.Wwb = 'based on egg diameter of 81 mum for Modiolus philippinarum: pi/6*0.0081^3';
data.Wwi = 22.2;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'sealifebase';
  comment.Wwi = 'Based on 10^(-3.716 + 2.847*log10(10*Li)) for Modiolus_modiolus, see F1';

data.Ri  = 3.7e6/365;   units.Ri  = '#/d'; label.Ri  = 'reproduction rate at SL 8.1 cm'; bibkey.Ri  = 'WongArsh2013';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'value for Modiolus philippinarum';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (yr), length (cm)
1.933	1.937
1.968	1.801
2.166	2.561
2.167	2.398
2.198	2.914
2.200	2.615
2.217	2.493
2.386	2.642
2.400	3.022
2.674	2.492
2.674	2.397
2.690	2.601
2.693	2.085
2.693	2.085
2.723	2.682
2.726	2.180
2.842	2.641
2.928	2.356
3.159	3.360
3.179	2.817
3.180	2.600
3.191	3.631
3.192	3.523
3.195	3.048
3.395	3.454
3.412	3.509
3.428	3.604
3.430	3.264
3.430	3.210
3.431	3.101
3.449	2.979
3.467	2.762
3.653	2.639
3.666	3.481
3.700	3.359
3.702	3.033
3.886	3.426
3.923	2.856
3.935	3.643
3.937	3.331
3.972	3.046
3.989	3.141
4.135	4.145
4.136	4.077
4.137	3.779
4.159	2.978
4.172	3.670
4.174	3.195
4.187	3.982
4.189	3.548
4.190	3.507
4.190	3.426
4.204	3.928
4.338	4.104
4.392	3.656
4.476	3.751
4.494	3.506
4.631	3.208
4.676	4.090
4.679	3.574
4.680	3.465
4.681	3.370
4.698	3.302
4.729	3.750
4.931	3.967
4.949	3.804
4.968	3.397
5.001	3.478
5.167	4.075
5.167	3.967
5.170	3.451
5.181	4.482
5.185	3.858
5.199	4.292
5.200	4.252
5.200	4.170
5.204	3.532
5.401	4.563
5.401	4.441
5.403	4.143
5.417	4.658
5.437	4.088
5.438	3.898
5.439	3.762
5.440	3.681
5.656	4.332
5.656	4.196
5.657	4.128
5.675	3.966
5.692	3.843
5.693	3.748
5.705	4.590
5.711	3.585
5.926	4.318
5.927	4.223
5.928	3.979
5.929	3.884
5.946	3.816
5.965	3.449
6.196	4.399
6.198	4.114
6.397	4.819
6.420	3.638
6.446	5.023
6.465	4.629
6.467	4.344
6.467	4.276
6.469	3.977
6.614	5.212
6.724	3.800
6.872	4.465
6.873	4.302
6.887	4.845
6.924	4.194
6.942	4.031
7.195	4.085
7.414	4.220
7.428	4.831
7.428	4.736
7.431	4.288
7.447	4.423
7.664	4.898
7.716	4.654
7.898	5.359
7.917	4.938
7.933	5.196
7.933	5.128
7.935	4.843
8.204	5.046
8.224	4.625
8.410	4.516
8.662	4.774
8.708	5.629
8.731	4.516
8.912	5.466
8.946	5.330
8.985	4.502
9.404	5.220
9.671	5.749
9.672	5.505
9.928	5.124
10.954	6.140
11.684	5.514
12.662	6.001];
data.tL(:,1) = 365 * (-0.25 + data.tL(:,1)); % convert yr to d 
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PehaRich2007';
comment.tL = 'Sata from from Mali Ston Bay, Croatia';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 20 * weights.tL; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.5; units.psd.k = '-'; label.psd.k = 'maintenance rate coeffcient';
weights.psd.k = 3; 
weights.psd.v = 3 * weights.psd.v; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: soft-tissue log10(Ww in g) = -3.716 + 2.847*log10(shell length in mm)';
metaData.bibkey.F1 = 'BaguRich2013'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '43TR5'; % Cat of Life
metaData.links.id_ITIS = '79508'; % ITIS
metaData.links.id_EoL = '46466766'; % Ency of Life
metaData.links.id_Wiki = 'Modiolus_barbatus'; % Wikipedia
metaData.links.id_ADW = 'Modiolus_barbatus'; % ADW
metaData.links.id_Taxo = '39211'; % Taxonomicon
metaData.links.id_WoRMS = '140464'; % WoRMS
metaData.links.id_molluscabase = '140464'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Modiolus_barbatus}}';
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
bibkey = 'PehaRich2007'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00227-006-0501-3}, ' ...
'author = {M. Peharda and C. A. Richardson and I. Mladineo and S. Sestanovic and Z. Popovicic and J. Bolotin and N. Vrgoc}, ' ... 
'year = {2007}, ' ...
'title = {Age, growth and population structure of \emph{Modiolus barbatus} from the {A}driatic}, ' ...
'journal = {Mar Biol}, ' ...
'volume = {151}, ' ...
'pages = {629-638}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WongArsh2013'; type = 'Article'; bib = [ ... 
'doi = {10.3923/ajava.2013.100.107}, ' ...
'author = {Nur Leena Wong and Aziz Arshad}, ' ... 
'year = {2013}, ' ...
'title = {Induced Spawning and Early Development of \emph{Modiolus philippinarum} ({H}anley, 1843) ({B}ivalvia: {M}ytilidae)}, ' ...
'journal = {Asian Journal of Animal and Veterinary Advances}, ' ...
'volume = {8}, ' ...
'pages = {100-107}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'marlin'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.marlin.ac.uk/biotic/browse.php?sp=4302}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

