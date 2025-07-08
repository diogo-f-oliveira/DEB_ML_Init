function [data, auxData, metaData, txtData, weights] = mydata_Macrochelys_temminckii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Chelydridae';
metaData.species    = 'Macrochelys_temminckii'; 
metaData.species_en = 'Alligator snapping turtle';

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTd', 'biFp', 'biFl', 'biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'Dt'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 05 01];

%% set data
% zero-variate data

data.ab = 120;     units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'AnAge';
  temp.ab = C2K(30.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 11*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(24);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 70.3*365;     units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 3; units.Lb = 'cm';   label.Lb = 'carapace length at birth';   bibkey.Lb = 'Dobi1971';
data.Lp = 33; units.Lp = 'cm';   label.Lp = 'carapace length at puberty for female';   bibkey.Lp = 'Wiki';
data.Li = 80.8; units.Li = 'cm';   label.Li = 'ultimate carapace length';      bibkey.Li = 'Wiki';

data.Wwp = 8e3; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'Wiki';
data.Wwi = 58500; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'AnAge';
  comment.Wwi = 'ADW 80 kg; Wiki 113 kg';

data.Ri  = 30/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), carapace length (cm)
0.361	3.972
1.151	7.823
1.260	4.784
3.192	13.303
3.277	16.108
4.214	16.686
8.155	33.257
9.081	29.628
9.171	34.419
9.176	36.406
10.136	30.789
10.172	29.737
10.220	33.010
11.197	34.055
11.228	31.133
12.028	39.076
12.171	33.815
13.078	38.133
13.187	34.977
14.046	35.672
14.195	32.866
14.209	38.243
14.219	42.100
15.137	35.314
15.141	37.068
16.188	35.074
16.319	40.333
17.132	38.106
17.136	39.860
18.151	40.437
20.133	38.320
22.092	42.164
23.207	36.196
25.023	45.300];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'carapace length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Dobi1971';

%% set weights for all real data
weights = setweights(data, []);
weights.tp = 0 * weights.tp;

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
D1 = 'Males are assumed not to differ';   
D2 = 'age at puberty is ignored because it is incosistent with Lp combined with tL data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Temperature <26 C, males develop from eggs, >29.5 Cfemales';
metaData.bibkey.F1 = 'ADW';
F2 = 'Males are larger tha females'; 
metaData.bibkey.F2 = 'Wiki';
F3 = 'A vermiform  appendage on the tip of its tongue used to lure fish';
metaData.bibkey.F3 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '3X3WY'; % Cat of Life
metaData.links.id_ITIS = '668671'; % ITIS
metaData.links.id_EoL = '791511'; % Ency of Life
metaData.links.id_Wiki = 'Macrochelys_temminckii'; % Wikipedia
metaData.links.id_ADW = 'Macrochelys_temminckii'; % ADW
metaData.links.id_Taxo = '48509'; % Taxonomicon
metaData.links.id_WoRMS = '1026089'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Macrochelys&species=temminckii'; % ReptileDB
metaData.links.id_AnAge = 'Macrochelys_temminckii'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Macrochelys_temminckii}}';
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
bibkey = 'Dobi1971'; type = 'Article'; bib = [ ... 
'author = {James L. Dobie}, ' ... 
'year = {1971}, ' ...
'title = {Reproduction and Growth in the Alligator Snapping Turtle, \emph{Macroclemys temmincki} (Troost)}, ' ...
'journal = {Copeia}, ' ...
'number = {1}, ' ...
'volume = {1971(4)}, ' ...
'pages = {645-658}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Macrochelys_temminckii/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Macrochelys_temminckii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

