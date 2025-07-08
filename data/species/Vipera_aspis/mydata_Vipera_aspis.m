function [data, auxData, metaData, txtData, weights] = mydata_Vipera_aspis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Viperidae';
metaData.species    = 'Vipera_aspis'; 
metaData.species_en = 'Asp adder'; 

metaData.ecoCode.climate = {'Cs','Cfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iThh', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv', 'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 02];

%% set data
% zero-variate data

data.ab = 89;     units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'Naul1973';
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'data from zoo; 150 d in the wild due to temp';
data.tp = 603;     units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'Naul1973';
  temp.tp = C2K(25); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'males are fertile at 9 mnth in captivity';
data.am = 25*365;  units.am = 'd';    label.am = 'life span';    bibkey.am = 'AnAge';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 22;    units.Lb  = 'cm';  label.Lb  = 'total length at hatching';  bibkey.Lb  = 'Naul1973';  
data.Li  = 78.5;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'Naul1973';
  comment.Li = 'Wiki: males can grow till 85 cm, but are slimmer';

data.Wwb = 9;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'Naul1973';
data.Wwi = 225;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'Naul1973';
  
data.Ri  = 5.6/365/2;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Naul1973';   
  temp.Ri = C2K(18);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 till 9 per clutch each other year';

% univariate data
% time-length-weight
data.tLW = [ ... % time since birth (month), total (cm)
    0 21     6.5 % f1
    0 22.5   9 % m
    0 22.5  11 % f
  365 44    47 % m
  365 43.5  49 % f
  347 51    66 % f1
  702 70   152 % f1
 1098 78.5 225]; % f1
units.tLW  = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW   = C2K(25);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'Naul1973'; treat.tLW = {1, {'total length','weight'}};
comment.tLW = 'Temp is guessed, 20-38 C during day 18-24 C during night';

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = weights.tLW * 5; weights.tLW(2:5,:)=0;
% weights.Wwi = weights.Wwi * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Ovoviviparous';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Males longer than females, but weigh less';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '5BJ7S'; % Cat of Life
metaData.links.id_ITIS = '634986'; % ITIS
metaData.links.id_EoL = '289379'; % Ency of Life
metaData.links.id_Wiki = 'Vipera_aspis'; % Wikipedia
metaData.links.id_ADW = 'Vipera_aspis'; % ADW
metaData.links.id_Taxo = '50336'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Vipera&species=aspis'; % ReptileDB
metaData.links.id_AnAge = 'Vipera_aspis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Vipera_aspis}}';
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
bibkey = 'Naul1973'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1748-1090.1973.tb02115.x}, ' ...
'author = {Naulleau, G.}, ' ... 
'year = {1973}, ' ...
'title = {Rearing the Asp viper \emph{Vipera aspis} in captivity}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {13(1)}, ' ...
'pages = {108–111}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
