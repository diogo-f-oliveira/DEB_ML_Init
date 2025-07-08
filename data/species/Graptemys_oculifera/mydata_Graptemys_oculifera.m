function [data, auxData, metaData, txtData, weights] = mydata_Graptemys_oculifera
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Emydidae';
metaData.species    = 'Graptemys_oculifera'; 
metaData.species_en = 'Ringed map turtle';

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTd', 'biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
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

data.ab = 64;     units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'ADW';   
  temp.ab = C2K(29);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = '65-85 d';
data.tp = 9*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';
  temp.tp = C2K(22);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '13-18';
data.tpm = 3*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'ADW';
  temp.tpm = C2K(22);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 20.5*365;     units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 3; units.Lb = 'cm';   label.Lb = 'carapace length at birth';      bibkey.Lb = 'ADW';
  comment.Lb = '22.3-32.7 mm plastron length';
data.Li = 22; units.Li = 'cm';   label.Li = 'ultimate carapace length';      bibkey.Li = 'ADW';
data.Lim = 10; units.Lim = 'cm';   label.Lim = 'ultimate carapace length for males';      bibkey.Lim = 'ADW';

data.Wwb = 9.5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'ADW';
data.Wwi = 1593; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'EoL';
 
data.Ri = 8*1.2/365;     units.Ri = '#/d';    label.Ri = 'maximum reproduction rate';   bibkey.Ri = 'ADW';   
  temp.Ri = C2K(22);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = '1-10 eggs per clutch, 1, sometimes 2 clutches per yr';

% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), plastron length (cm)
1.849	6.439
2.934	7.128
4.016	8.351
4.998	9.039
5.923	10.606];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
data.tL_f(:,2) = data.tL_f(:,2) / 0.93; % convert plastron to carapace length (guessed)
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'carapace length', 'female'};  
temp.tL_f    = C2K(22);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'JoneHart1995';
comment.tL_f = 'Data for females; temp is guessed';
%
data.tL_m = [ ... % time since birth (yr), plastron length (cm)
2.228	6.420
2.953	6.566
3.886	6.931
5.130	7.077];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
data.tL_m(:,2) = data.tL_m(:,2) / 0.93; % convert plastron to carapace length (guessed)
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'carapace length', 'male'};  
temp.tL_m    = C2K(22);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'JoneHart1995';
comment.tL_m = 'Data for males; temp is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;

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
metaData.links.id_CoL = '6KT7B'; % Cat of Life
metaData.links.id_ITIS = '173798'; % ITIS
metaData.links.id_EoL = '456490'; % Ency of Life
metaData.links.id_Wiki = 'Graptemys_oculifera'; % Wikipedia
metaData.links.id_ADW = 'Graptemys_oculifera'; % ADW
metaData.links.id_Taxo = '48626'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Graptemys&species=oculifera'; % ReptileDB
metaData.links.id_AnAge = 'Graptemys_oculifera'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Graptemys_oculifera}}';
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
bibkey = 'JoneHart1995'; type = 'Article'; bib = [ ... 
'author = {R. L. Jones and Paul D. Hartfield}, ' ... 
'year = {1995}, ' ...
'title = {Population Size and Growth in the Turtle \emph{Graptemys oculifera}}, ' ...
'journal = {Journal of Herpetology} , ' ...
'volume = {29(3)}, ' ...
'pages = {426-436}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/456490}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Graptemys_oculifera/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Graptemys_oculifera}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


