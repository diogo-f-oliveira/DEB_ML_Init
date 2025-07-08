function [data, auxData, metaData, txtData, weights] = mydata_Graptemys_caglei
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Emydidae';
metaData.species    = 'Graptemys_caglei'; 
metaData.species_en = 'Cagle''s map turtle';

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTd', 'biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 06];              
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

data.ab = 60;     units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(29);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 3*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 1.6*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty'; bibkey.tpm = 'Lind1999';
  temp.tpm = C2K(25);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 14.5*365;     units.am = 'd';    label.am = 'life span';           bibkey.am = 'EoL';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 3.0; units.Lb = 'cm';   label.Lb = 'carapace length at birth';      bibkey.Lb = 'Lind1999';
data.Li = 18; units.Li = 'cm';   label.Li = 'ultimate carapace length';      bibkey.Li = 'Wiki';
data.Lim = 10; units.Lim = 'cm';   label.Lim = 'ultimate carapace length for males';      bibkey.Lim = 'Wiki';

data.Wwi = 1233; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'EoL';
 
data.Ri = 4*8/365;     units.Ri = '#/d';    label.Ri = 'maximum reproduction rate';   bibkey.Ri = 'guess';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = '6-13 eggs per clutch, 4 clutches per yr';

% uni-variate data

% time-length
data.tL_m = [ ... % time since birth (yr), plastron length (cm)
0.108	4.282
0.163	3.811
0.164	4.079
0.176	3.373
0.219	3.743
0.248	3.642
0.290	3.641
0.435	4.379
0.478	4.513
0.563	4.310
0.564	4.613
0.678	4.746
0.708	5.183
0.722	5.115
0.735	4.779
0.738	5.518
0.780	5.384
1.223	5.950
1.341	7.226
1.751	6.717
2.122	7.083
2.164	6.679
2.166	7.418
2.205	6.309
2.224	7.754
2.390	6.508];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
data.tL_m(:,2) = data.tL_m(:,2) / 0.93; % convert plastron to carapace length (guessed)
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'carapace length'};  
temp.tL_m    = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Lind1999';
comment.tL_m = 'Data for males; temp is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_m = 3 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';   
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '6KSVF'; % Cat of Life
metaData.links.id_ITIS = '173792'; % ITIS
metaData.links.id_EoL = '456484'; % Ency of Life
metaData.links.id_Wiki = 'Graptemys_caglei'; % Wikipedia
metaData.links.id_ADW = 'Graptemys_caglei'; % ADW
metaData.links.id_Taxo = '399205'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Graptemys&species=caglei'; % ReptileDB
metaData.links.id_AnAge = 'Graptemys_caglei'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Graptemys_caglei}}';
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
bibkey = 'Lind1999'; type = 'Article'; bib = [ ... 
'author = {Peter V. Lindeman}, ' ... 
'year = {1999}, ' ...
'title = {Growth Curves for \emph{Graptemys}, with a Comparison to Other Emydid Turtles}, ' ...
'journal = {Am. Midl. Nat.} , ' ...
'volume = {142}, ' ...
'pages = {141-151}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/456484}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

