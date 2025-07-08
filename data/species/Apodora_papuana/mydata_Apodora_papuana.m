function [data, auxData, metaData, txtData, weights] = mydata_Apodora_papuana

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Pythonidae';
metaData.species    = 'Apodora_papuana'; 
metaData.species_en = 'Irian python'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tntf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvm'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww', 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 07 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 07 26]; 


%% set data
% zero-variate data

data.ab = 90;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'TryoWhit1988';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '87 till 93 d';
data.ap = 3*365;     units.ap = 'd';    label.ap = 'age at puberty for female'; bibkey.ap = 'guess';
  temp.ap = C2K(27);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 30*365;     units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 67;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'TryoWhit1988';
  comment.Lb = 'Wiki: 38 till 51';
data.Li  = 513;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'TryoWhit1988';

data.Wwb = 97.1; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'TryoWhit1988';
data.Wwi = 26780;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'TryoWhit1988';

data.Ri  = 22/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'TryoWhit1988';   
  temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time, length, weight
tLW = [ ... time since hatch (d), length (cm), weight (g)
      0   67     97.1
    162  NaN    153.5
    373  118.4  317.4
    477  NaN    438.8
    865  165.3  732.9];
data.tW = tLW(:,[1 3]);
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(27);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'TryoWhit1988';
%
data.LW = tLW(~(isnan(tLW(:,2))),[2 3]);
units.LW = {'cm', 'g'};     label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'TryoWhit1988';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 
weights.psd.p_M = 5 * weights.psd.p_M;
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'ab is ignored, since, Like all pythons, this species is probably partially ovoviviparous: eggs start to develop, while still in the mother';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '87Q74'; % Cat of Life
metaData.links.id_ITIS = '634768'; % ITIS
metaData.links.id_EoL = '1057117'; % Ency of Life
metaData.links.id_Wiki = 'Apodora_papuana'; % Wikipedia
metaData.links.id_ADW = 'Apodora_papuana'; % ADW
metaData.links.id_Taxo = '644250'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Apodora&species=papuana'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Apodora}}';
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
bibkey = 'TryoWhit1988'; type = 'Article'; bib = [ ... 
'author = {B. W. Tryon and J. Whitehead}, ' ... 
'year = {1988}, ' ...
'title = {Reproduction in a little-known {N}ew {G}uinea phyton, \emph{Liasis papuanus} (Peters and Doria)}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {7}, ' ...
'pages = {371--379}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

