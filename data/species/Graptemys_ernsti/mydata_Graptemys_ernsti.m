function [data, auxData, metaData, txtData, weights] = mydata_Graptemys_ernsti
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Emydidae';
metaData.species    = 'Graptemys_ernsti'; 
metaData.species_en = 'Escambia map turtle';

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTd', 'biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

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

data.ab = 76;     units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'ADW';   
  temp.ab = C2K(29);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = '65-85 d';
data.tp = 15.5*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';
  temp.tp = C2K(22);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '13-18';
data.tpm = 3*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'ADW';
  temp.tpm = C2K(22);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 31*365;     units.am = 'd';    label.am = 'life span';           bibkey.am = 'ADW';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'data unsure';

data.Lb = 3.2; units.Lb = 'cm';   label.Lb = 'carapace length at birth';      bibkey.Lb = 'Lind1999';
data.Li = 27.94; units.Li = 'cm';   label.Li = 'ultimate carapace length';      bibkey.Li = 'ADW';
data.Lim = 12.7; units.Lim = 'cm';   label.Lim = 'ultimate carapace length for males';      bibkey.Lim = 'ADW';

data.Wwi = 3349; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'EoL';
 
data.Ri = 4*10/365;     units.Ri = '#/d';    label.Ri = 'maximum reproduction rate';   bibkey.Ri = 'ADW';   
  temp.Ri = C2K(22);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = '6-13 eggs per clutch, 4 clutches per yr';

% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), plastron length (cm)
0.326	3.590
1.569	5.470
1.995	7.521
2.286	6.410
2.495	6.410
2.498	7.179
2.575	5.128
2.789	6.496
2.901	8.632
3.296	7.436
3.912	9.829
4.829	14.786
5.438	14.957
5.618	11.966
6.290	12.393
6.414	11.709
6.418	12.821
6.940	12.222
7.524	17.692
8.484	16.239];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
data.tL_f(:,2) = data.tL_f(:,2) / 0.93; % convert plastron to carapace length (guessed)
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'carapace length', 'female'};  
temp.tL_f    = C2K(22);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Lind1999';
comment.tL_f = 'Data for females; temp is guessed';
%
data.tL_m = [ ... % time since birth (yr), plastron length (cm)
2.711	8.291
3.633	8.034
4.326	8.034
4.765	7.521
4.997	7.949
5.504	9.231
5.754	8.547];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
data.tL_m(:,2) = data.tL_m(:,2) / 0.93; % convert plastron to carapace length (guessed)
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'carapace length', 'male'};  
temp.tL_m    = C2K(22);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Lind1999';
comment.tL_m = 'Data for females; temp is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

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
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '6KT7F'; % Cat of Life
metaData.links.id_ITIS = '551768'; % ITIS
metaData.links.id_EoL = '456485'; % Ency of Life
metaData.links.id_Wiki = 'Graptemys_ernsti'; % Wikipedia
metaData.links.id_ADW = 'Graptemys_ernsti'; % ADW
metaData.links.id_Taxo = '399206'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Graptemys&species=ernsti'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Graptemys_ernsti}}';
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
'howpublished = {\url{https://eol.org/pages/456485}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Graptemys_ernsti/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


