function [data, auxData, metaData, txtData, weights] = mydata_Rhinemys_rufipes
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Chelidae';
metaData.species    = 'Rhinemys_rufipes'; 
metaData.species_en = 'Red side-necked turtle';

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0bTd', 'biFp', 'biFl', 'biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'piO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L0-Lt'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 05 02];

%% set data
% zero-variate data

data.am = 40*365;     units.am = 'd';    label.am = 'life span';           bibkey.am = 'guess';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 3; units.Lb = 'cm';   label.Lb = 'carapace length at birth';   bibkey.Lb = 'guess';
data.Lp = 8; units.Lp = 'cm';   label.Lp = 'carapace length at puberty';   bibkey.Lp = 'MagnLima1997';
  comment.Lp = 'based on sexing is difficult less than CL 8 cm';
data.Li = 21.7; units.Li = 'cm';   label.Li = 'ultimate carapace length';      bibkey.Li = 'MagnLima1997';
data.Lim = 21.5; units.Lim = 'cm';   label.Lim = 'ultimate carapace length';      bibkey.Lim = 'MagnLima1997';

data.Wwi = 2394; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'EoL';

data.Ri  = 8/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on weight-corrected value for Podocnemis_unifilis: 40*2390/11600';

% uni-variate data

% length ar capture - length at recapture
LLt = [ % carapace length ar capture (cm), carapace length at recapture (cm)
5.56   7.17 0.644
10.60 20.20 4.038
20.20 20.60 1.504
20.60 21.20 4.668
22.10 22.20 8.699
 5.46  6.65 0.244
19.80 19.60 3.060
21.00 19.20 3.332
 5.46  6.17 0.279
21.60 22.60 3.693
 5.46  6.20 0.219
18.10 20.00 1.359
20.00 21.00 1.496
21.00 21.00 0.753
19.80 21.20 1.507
21.20 21.30 1.951
18.80 22.50 11.375
19.80 21.10 1.493
21.10 21.50 1.521
21.50 21.70 0.901
14.05 14.80 0.690
19.10 20.10 1.088
17.60 17.00 0.907
15.60 16.20 1.016
25.70 25.00 0.907
 5.46  7.30 0.190
 5.46  5.90 0.055
19.10 21.30 2.066];
data.LL_f = LLt(:,1:2);
units.LL_f   = {'cm', 'cm'};  label.LL_f = {'carapace length at capture', 'carapace length at recapture'}; 
time.LL_f = 365*LLt(:,3); units.time.LL_f = 'd'; label.time.LL_f = 'time between caputurr and recapture';
treat.LL_f = {0}; units.treat.LL_f = ''; label.treat.LL_f = '';
temp.LL_f    = C2K(28);  units.temp.LL_f = 'K'; label.temp.LL_f = 'temperature';
bibkey.LL_f = 'MagnLima1997';
comment.LL_f = 'Data for females; temp is guessed';
%
LLt = [ % carapace length ar capture (cm), carapace length at recapture (cm)
10.06 15.20 1.726
10.90 13.30 2.586
20.00 19.50 1.542
 5.46  7.12 1.005
 7.12  9.20 2.337
 9.20 16.50 3.956
22.00 23.00 8.370
19.40 21.10 5.293
20.40 20.40 3.293
20.80 20.40 0.822
 5.46  7.90 0.868
15.20 17.30 1.866
12.80 14.70 1.304
 5.46  7.20 1.074
 7.20 18.80 2.734
21.00 20.30 2.315
15.40 17.00 1.562
14.20 19.95 4.052
19.95 20.10 0.841
20.30 20.40 1.636];
data.LL_m = LLt(:,1:2);
units.LL_m   = {'cm', 'cm'};  label.LL_m = {'carapace length at capture', 'carapace length at recapture'}; 
time.LL_m = 365*LLt(:,3); units.time.LL_m = 'd'; label.time.LL_m = 'time between caputure and recapture';
treat.LL_m = {0}; units.treat.LL_m = ''; label.treat.LL_m = '';
temp.LL_m    = C2K(28);  units.temp.LL_m = 'K'; label.temp.LL_m = 'temperature';
bibkey.LL_m = 'MagnLima1997';
comment.LL_m = 'Data for males; temp is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.LL_f = 5 * weights.LL_f;
weights.LL_m = 5 * weights.LL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.time = time;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';   
D2 = 'age at puberty is ignored because it is inconsistent with Lp combined with tL data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '4S7QG'; % Cat of Life
metaData.links.id_ITIS = '949494'; % ITIS
metaData.links.id_EoL = '791094'; % Ency of Life
metaData.links.id_Wiki = 'Rhinemys_rufipes'; % Wikipedia
metaData.links.id_ADW = 'Rhinemys_rufipes'; % ADW
metaData.links.id_Taxo = '1685669'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Rhinemys&species=rufipes'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhinemys_rufipes}}';
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
bibkey = 'MagnLima1997'; type = 'Article'; bib = [ ... 
'author = {William E. Magnusson and Aldeniza Cardoso de Lima and Valdenise Lopes de Costa and Odilon Pimentel de Lima}, ' ... 
'year = {1997}, ' ...
'title = {Growth of the turtle, \emph{Phrynops rufipes} in central {A}maz\^{o}nia, {B}razil}, ' ...
'journal = {Chelonian Conservation and Biology}, ' ...
'volume = {2(4)}, ' ...
'pages = {78-87}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/791094}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

