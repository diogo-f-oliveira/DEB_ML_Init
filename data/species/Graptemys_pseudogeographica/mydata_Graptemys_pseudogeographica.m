function [data, auxData, metaData, txtData, weights] = mydata_Graptemys_pseudogeographica
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Emydidae';
metaData.species    = 'Graptemys_pseudogeographica'; 
metaData.species_en = 'False map turtle'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTd', 'biFp'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-r'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 03];              
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

data.ab = 62;     units.ab = 'd';    label.ab = 'age at birth';                     bibkey.ab = 'ADW';   
  temp.ab = C2K(31);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '52 to 73 d';
data.am = 35.4*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 3.2;   units.Lb   = 'cm';  label.Lb  = 'carapace length at birth';         bibkey.Lb  = 'Webb1961'; 
  comment.Lb = 'based on plastron length: 2.927/0.92, see F1';
data.Lp  = 16.3;   units.Lp  = 'cm';  label.Lp  = 'plastron length at puberty for females'; bibkey.Lp  = 'Webb1961';
  comment.Lp = 'based on plastron length: 15/0.92, see F1';
data.Lpm  = 7.6;   units.Lpm  = 'cm';  label.Lpm  = 'plastron length at puberty for males'; bibkey.Lpm  = 'Webb1961';
  comment.Lpm = 'based on plastron length: 7/0.92, see F1';
data.Li  = 27;   units.Li  = 'cm';  label.Li  = 'ultimate carapace length for females'; bibkey.Li  = 'ADW';
data.Lim = 15;   units.Lim  = 'cm';  label.Lim  = 'ultimate carapace length for males'; bibkey.Lim  = 'ADW';

data.Wwb = 8.5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'ADW';
  comment.Wwb = '6-11 g';
data.Wwi = 1800; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'ADW';

data.Ri  = 3*6.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';             bibkey.Ri  = 'Webb1961';   
  temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6.5  eggs per clutch, 3 clutch per yr';
 
% uni-variate data
% length-spec growth rate
data.tL_f = [ ... % time since birth (yr), plastron length(0) (cm)
0	2.927
1	5.003
2	7.109
3	9.542];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
data.tL_f(:,1) = data.tL_f(:,1)/ 0.92; % convert plastron to carapace length, see F2
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'carapace length', 'female'};  
temp.tL_f   = C2K(27);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Webb1961';
comment.tL_f = 'Data for females; based on plastron length';
%
data.tL_m = [ ... % time since birth (yr), plastron length(0) (cm)
0	3.034
1	5.006
2	6.873];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
data.tL_m(:,1) = data.tL_m(:,1)/ 0.92; % convert plastron to carapace length, see F2
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'carapace length', 'male'};  
temp.tL_m   = C2K(27);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Webb1961';
comment.tL_m = 'Data for males; ; based on plastron length';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp  only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'platron length = 0.92 * carapace length';
metaData.bibkey.F1 = 'Webb1961'; 
F2 = 'Temperature < 25 C gives males, > 30 C females';
metaData.bibkey.F2 = 'ADW'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6KT7C'; % Cat of Life
metaData.links.id_ITIS = '173800'; % ITIS
metaData.links.id_EoL = '456492'; % Ency of Life
metaData.links.id_Wiki = 'Graptemys_pseudogeographica'; % Wikipedia
metaData.links.id_ADW = 'Graptemys_pseudogeographica'; % ADW
metaData.links.id_Taxo = '48627'; % Taxonomicon
metaData.links.id_WoRMS = '1463697'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Graptemys&species=pseudogeographica'; % ReptileDB
metaData.links.id_AnAge = 'Graptemys_pseudogeographica'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Graptemys_pseudogeographica}}';
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
bibkey = 'Webb1961'; type = 'Article'; bib = [ ... 
'author = {Robert G. Webb}, ' ... 
'year = {1961}, ' ...
'title = {Observations on the Life Histories of Turtles (Genus \emph{Pseudemys} and \emph{Graptemys}) in {L}ake {T}exoma, {O}klahoma}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'volume = {65(1)}, ' ...
'pages = {193-214}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Graptemys_pseudogeographica}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/456492}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Graptemys_pseudogeographica/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

