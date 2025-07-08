function [data, auxData, metaData, txtData, weights] = mydata_Varanus_niloticus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Varanidae';
metaData.species    = 'Varanus_niloticus'; 
metaData.species_en = 'Nile monitor'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bpCvr', 'biCvm', 'biSv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O', 'Apa'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 11];

%% set data
% zero-variate data

data.ab = 129;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'ADW';   
  temp.ab = C2K(28.5);    units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'data for captive individuals, 300 d in the wild';
data.tp = 1278; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(28.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 14.6*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(28.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 10.8;   units.Lb  = 'cm';  label.Lb  = 'SVL at birth'; bibkey.Lb  = 'guess'; 
  comment.Lb = 'based on (Wwb/Wwi)^(1/3)*Li: 52*(26/2827)^(1/3)';
data.Li  = 52;   units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'BuffCast2000';
  comment.Li = 'TL 220 cm, max 244 cm';

data.Wwb = 26;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ADW';
data.Wwi = 3600;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'BuffCast2000';
  comment.Wwi = 'Wiki: up to 20 kg';

data.Ri  = 25/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'ADW';   
temp.Ri = C2K(28.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '20-30 eggs per clutch, 1 clutch per yr';
 
% uni-variate data
% length-change in length
data.LdL_f = [ ... % SVL (cm), percent change in SVL in a yr (-)
34.295	25.243
34.547	26.008
35.032	15.634
46.292	5.199
47.214	6.028
51.859	7.237];
data.LdL_f(:,2) =  data.LdL_f(:,2)/ 100 .* data.LdL_f(:,1)/ 365; % convert to cm/d
units.LdL_f   = {'cm', 'cm/d'};  label.LdL_f = {'SVL', 'change in SVL', 'females'};  
temp.LdL_f    = C2K(28.5);  units.temp.LdL_f = 'K'; label.temp.LdL_f = 'temperature';
bibkey.LdL_f = 'BuffCast2000';
%
data.LdL_m = [ ... % SVL (cm), percent change in SVL in a yr (-)
36.588	27.124
45.355	19.153
46.376	4.603
51.718	8.376];
data.LdL_m(:,2) =  data.LdL_m(:,2)/ 100 .* data.LdL_m(:,1)/ 365; % convert to cm/d
units.LdL_m   = {'cm', 'cm/d'};  label.LdL_m = {'SVL', 'change in SVL', 'males'};  
temp.LdL_m    = C2K(28.5);  units.temp.LdL_m = 'K'; label.temp.LdL_m = 'temperature';
bibkey.LdL_m = 'BuffCast2000';

% length-weight
data.LW = [ ... % SVL (cm), wet weight (g)
    36.6  910
    46.4 2250
    34.5  900
    51.7 2850
    46.3 1800
    45.3 1850
    51.8 3600
    47.2 1950
    34.1  883
    35.0  800];
units.LW   = {'cm', 'g'};  label.LW = {'SVL', 'weight'};  
bibkey.LW = 'BuffCast2000';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL_f = 3 * weights.LdL_f;
weights.LdL_m = 3 * weights.LdL_m;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LdL_f','LdL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Temperatures are guessed';
D2 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '7FG7Z'; % Cat of Life
metaData.links.id_ITIS = '683047'; % ITIS
metaData.links.id_EoL = '790177'; % Ency of Life
metaData.links.id_Wiki = 'Varanus_niloticus'; % Wikipedia
metaData.links.id_ADW = 'Varanus_niloticus'; % ADW
metaData.links.id_Taxo = '49766'; % Taxonomicon
metaData.links.id_WoRMS = '1606288'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Varanus&species=niloticus'; % ReptileDB
metaData.links.id_AnAge = 'Varanus_niloticus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Varanus_niloticus}}';
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
bibkey = 'BuffCast2000'; type = 'Article'; bib = [ ... 
'author = {Vivian de Buffr\''{e}nil and Jacques Castanet}, ' ... 
'year = {2000}, ' ...
'title = {Age Estimation by Skeletochronology in the {N}ile Monitor (\emph{Varanus niloticus}), a Highly Exploited Species}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {34(3)}, ' ...
'pages = {414-424}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Varanus_niloticus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Varanus_niloticus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

