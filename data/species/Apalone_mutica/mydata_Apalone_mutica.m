function [data, auxData, metaData, txtData, weights] = mydata_Apalone_mutica
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Trionychidae';
metaData.species    = 'Apalone_mutica'; 
metaData.species_en = 'Smooth softshell turtle';

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTd', 'biFp', 'biFl', 'biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am';  'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data

data.ab = 70;     units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'Wiki';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = '8-12 wk';
data.tp = 9.5*365;     units.tp = 'd';    label.tp = 'time since birth at puberty';     bibkey.tp = 'Plum1977';   
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.tpm = 4.5*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males';  bibkey.tpm = 'Plum1977';   
  temp.tpm = C2K(20);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature'; 
data.am = 50*365;     units.am = 'd';    label.am = 'life span';           bibkey.am = 'Wiki';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'value for Apalone spinifera';

data.Lb = 2.45; units.Lb = 'cm';   label.Lb = 'plastron length at birth';   bibkey.Lb = 'Plum1977';
  comment.Lb = 'Wiki gives carapace length of 4 cm';
data.Lp = 14; units.Lp = 'cm';   label.Lp = 'plastron length at puberty for female';   bibkey.Lp = 'Plum1977';
data.Lpm = 8; units.Lpm = 'cm';   label.Lpm = 'plastron length at puberty for male';   bibkey.Lpm = 'Plum1977';
data.Li = 35.6; units.Li = 'cm';   label.Li = 'ultimate plastron length for females';      bibkey.Li = 'ADW';
data.Lim = 17.8; units.Lim = 'cm';   label.Lim = 'ultimate plastron length for males';      bibkey.Lim = 'Wiki';
  comment.Lim = 'ADW gives 26.6 cm';

data.Wwb = 5.4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki';
data.Wwi = 5991; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'EoL';
  
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), plastron length (cm)
0.000	2.603
0.942	4.672
1.889	6.209
2.917	7.628
3.865	9.165
4.934	10.111
5.843	11.352
6.869	13.007
7.860	13.717
8.929	14.485
9.880	15.195
10.871	15.549
11.901	16.081
12.813	16.436
13.764	17.264];
data.tL_f(:,1) = data.tL_f(:,1) * 365;
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'plastron length', 'female'};  
temp.tL_f    = C2K(20);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Plum1977';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), plastron length (cm)
0.055	2.498
1.070	4.813
2.076	6.190
3.117	7.070
3.962	8.154
5.118	8.623
5.997	9.179
7.033	9.560
8.026	9.648
8.942	9.912
10.016	10.117
11.049	10.176
11.964	10.352
12.917	10.440
13.951	10.615
15.144	10.762
16.019	10.879];
data.tL_m(:,1) = data.tL_m(:,1) * 365;
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'plastron length', 'male'};  
temp.tL_m    = C2K(20);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Plum1977';
comment.tL_m = 'Data for males';

% length-fecundity
data.LN = [ ... % plastron length (cm), yearly fecundity (#)
14.327	12.918
14.984	22.916
14.985	16.740
15.176	32.656
15.201	17.131
15.259	10.083
15.335	29.331
15.371	23.337
15.371	20.338
15.506	26.891
15.527	37.130
15.527	36.777
15.529	24.424
15.633	16.678
15.712	22.162
15.872	17.426
16.017	28.746
16.030	19.042
16.120	25.411
16.247	18.198
16.332	45.742
16.336	26.684
16.337	20.684
16.348	23.157
16.517	27.952
16.519	18.070
16.877	47.603
16.907	13.020
16.939	22.379
17.231	42.372
17.238	63.020
17.414	31.992
17.959	36.147
18.391	37.282];
units.LN   = {'cm', '#'};  label.LN = {'plastrom length', 'yearly fecundity'};  
temp.LN    = C2K(20);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Plum1977';
    

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 2 * weights.tL_f;
weights.tL_m = 2 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';   
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Sex is determined by genetics';
metaData.bibkey.F1 = 'Wiki';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'F6QQ'; % Cat of Life
metaData.links.id_ITIS = '208677'; % ITIS
metaData.links.id_EoL = '795755'; % Ency of Life
metaData.links.id_Wiki = 'Apalone_mutica'; % Wikipedia
metaData.links.id_ADW = 'Apalone_mutica'; % ADW
metaData.links.id_Taxo = '48404'; % Taxonomicon
metaData.links.id_WoRMS = '1459891'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Apalone&species=mutica'; % ReptileDB
metaData.links.id_AnAge = 'Apalone_mutica'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Apalone_mutica}}';
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
bibkey = 'Plum1977'; type = 'Article'; bib = [ ... 
'author = {Michael V. Plummer}, ' ... 
'year = {1977}, ' ...
'title = {Reproduction and Growth in the Turtle \emph{Trionyx muticus}}, ' ...
'journal = {Copeia}, ' ...
'volume = {1977(3)}, ' ...
'pages = {440-447}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/795755}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Apalone_mutica/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

