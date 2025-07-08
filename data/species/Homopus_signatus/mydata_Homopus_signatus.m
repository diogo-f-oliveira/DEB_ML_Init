function [data, auxData, metaData, txtData, weights] = mydata_Homopus_signatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Testudinidae';
metaData.species    = 'Homopus_signatus'; 
metaData.species_en = 'Speckled padloper'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'biMm'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 05 04];

%% set data
% zero-variate data

data.ab = 110;      units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'Wiki';   
  temp.ab = C2K(29);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '100-120 d';
data.tp = 3.5*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Loeh2004';
  temp.tp = C2K(23);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '3.5 yr in captivity, 11 yr in the wild';
data.am = 30*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(23);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 3.0; units.Lb = 'cm';   label.Lb = 'carapace length at birth';   bibkey.Lb = 'Wiki';
data.Lp = 8.4; units.Lp = 'cm';   label.Lp = 'carapace length at puberty';   bibkey.Lp = 'Loeh2004';
data.Li = 11; units.Li = 'cm';   label.Li = 'ultimate carapace length';   bibkey.Li = 'Loeh2004';
data.Lim = 8.95; units.Lim = 'cm';   label.Lim = 'ultimate carapace length for males';   bibkey.Lim = 'Loeh2004';

data.Wwb = 7; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Wiki';
  comment.Wwb = '7.8-11.9 g';
data.Wwi = 241; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'Loeh2004';
data.Wwim = 113; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'Loeh2004';

data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';             bibkey.Ri  = 'guess';   
  temp.Ri = C2K(23);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wiki: "several eggs" per clutch, 1 clutch per yr assumed';
 
% uni-variate data

% length-change in length
data.LdL = [ ... % carapace length (cm), change in carapace length (mm/yr)
3.984	7.904
3.988	3.125
4.120	11.230
4.123	7.905
4.142	4.303
4.418	8.253
4.911	11.582
5.377	10.962
5.850	3.070
6.305	13.948
6.359	6.814
6.454	4.944
6.950	4.948
7.094	0.794
7.101	9.452
7.104	5.919
7.107	3.703
7.277	4.466
7.340	3.289
7.420	0.588
7.448	3.636
7.466	1.143
7.498	-0.381
7.527	2.251
7.572	3.360
7.591	-0.103
7.698	1.699
7.789	4.539
7.946	1.701
7.948	0.454
7.978	1.285
8.011	-0.723
8.017	8.489
8.023	3.294
8.024	2.117
8.057	0.247
8.088	-0.584
8.102	1.355
8.162	3.087
8.257	1.010
8.258	0.456
8.319	1.219
8.382	0.457
8.399	-0.859
8.414	0.111
8.427	2.605
8.443	1.843
8.554	-0.303
8.583	1.498
8.629	1.844
8.708	-0.025
8.722	2.538
8.723	0.668
8.767	3.508
8.815	1.915
8.830	2.331
8.833	-0.024
8.908	2.054
8.925	1.154
8.936	5.310
9.004	-0.508
9.018	1.155
9.111	0.878
9.111	0.463
9.112	0.186
9.128	-0.160
9.203	2.541
9.219	1.503
9.237	-0.645
9.282	0.395
9.299	-0.990
9.391	0.396
9.561	0.951
9.561	0.535
9.609	-0.434
9.623	0.674
10.291	-0.221
10.398	2.274
10.508	0.543
11.006	-0.631];
data.LdL(:,2) = data.LdL(:,2)/ 3650; % convert mm/yr to cm/d
units.LdL   = {'cm', 'cm/d'};  label.LdL = {'carapace length', 'change in carapace length'};  
temp.LdL    = C2K(23);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'Loeh2004';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL = 3 * weights.LdL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'Males are supposed to differ from females by {p_Am} only';
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'At low temperatures males hatch, else females females';
metaData.bibkey.F1 = 'Loeh2004'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '8GPG6'; % Cat of Life
metaData.links.id_ITIS = '551787'; % ITIS
metaData.links.id_EoL = '1056288'; % Ency of Life
metaData.links.id_Wiki = 'Chersobius_signatus'; % Wikipedia
metaData.links.id_ADW = 'Homopus_signatus'; % ADW
metaData.links.id_Taxo = '48668'; % Taxonomicon
metaData.links.id_ReptileDB = 'genus=Chersobius&species=signatus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chersobius_signatus}}';
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
bibkey = 'Loeh2004'; type = 'Article'; bib = [ ... 
'author = {Victor J.T. Loehr}, ' ... 
'year = {2004}, ' ...
'title = {Growth of the {N}amaqualand speckled padloper, \emph{Homopus signatus signatus} ({R}eptilia: {T}estudinidae)}, ' ...
'journal = {African Zoology}, ' ...
'volume = {39(2)}, ' ...
'pages = {309-313}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

