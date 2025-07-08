function [data, auxData, metaData, txtData, weights] = mydata_Mecistops_cataphractus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Crocodilia'; 
metaData.family     = 'Crocodylidae';
metaData.species    = 'Mecistops_cataphractus'; 
metaData.species_en = 'West African slender-snouted crocodile'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0bTd', 'biFm', 'biFp', 'biFp', 'biFr'};
metaData.ecoCode.embryo  = {'Tl'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv', 'biCi'};
metaData.ecoCode.gender  = {'Dtfm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, JacoKush1989: envir temp between 21 and 29
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 09 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 09 18];


%% set data
% zero-variate data

data.ab = 95;        units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'ADW';   
  temp.ab = C2K(32); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '90-100 d';
data.tp = 12.5*365;  units.tp = 'd';    label.tp = 'time since birth at puberty for female';  bibkey.tp = 'ADW';
  temp.tp = C2K(25); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '10-15 yrs';
data.am = 56.1*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 32.5;     units.Lb  = 'cm';  label.Lb  = 'total length at birth';            bibkey.Lb  = 'ADW'; 
  comment.Lb = '28-35';
data.Lp  = 200;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';          bibkey.Lp  = 'ADW';
  comment.Lp = '2-2.5 m';
data.Li  = 250;    units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'ADW';
data.Lim = 420;    units.Lim  = 'cm'; label.Lim  = 'ultimate total length for male';  bibkey.Lim  = 'Wiki';

data.Ww0 = 104.7;   units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';             bibkey.Ww0 = 'Wiki';
  comment.Ww0 = 'based on eggs length 8 cm, width 5 cm: pi/6*8*5^2';
data.Wwi = 68.5e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight of female';  bibkey.Wwi = {'Wiki','ADW'};
 comment.Wwi = 'based on (Li/Lim)^3*Wwim';
data.Wwim = 325e3; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight of male';   bibkey.Wwim = 'Wiki';

data.Ri  = 15/365;   units.Ri  = '#/d'; label.Ri  = 'reprod rate at 364 cm';   bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '7-22 eggs per clutch, 1 cutch per yr assumed';
 
%% set weights for all real data
weights = setweights(data, []);

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'temperature effects sex of neonate: below  30 C neonates are female and above 34 C male';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3YKJB'; % Cat of Life
metaData.links.id_ITIS = '845140'; % ITIS
metaData.links.id_EoL = '795283'; % Ency of Life
metaData.links.id_Wiki = 'Mecistops_cataphractus'; % Wikipedia
metaData.links.id_ADW = 'Mecistops_cataphractus'; % ADW
metaData.links.id_Taxo = '3814887'; % Taxonomicon
metaData.links.id_WoRMS = '1478600'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Mecistops&species=cataphractus'; % ReptileDB
metaData.links.id_AnAge = 'Mecistops_cataphractus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mecistops_cataphractus}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Mecistops_cataphractus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Mecistops_cataphractus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
