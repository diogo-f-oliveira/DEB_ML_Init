  function [data, auxData, metaData, txtData, weights] = mydata_Coregonus_sardinella
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Coregonus_sardinella'; 
metaData.species_en = 'Sardine cisco'; 

metaData.ecoCode.climate = {'Dfb','Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0jFl'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 10 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 10]; 

%% set data
% zero-variate data
data.am = 26*365;   units.am = 'd';  label.am = 'life span';            bibkey.am = 'fishbase';   
  temp.am = C2K(8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 13;  units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'MuirVecs2014'; 
  comment.Lp = 'based on tp 5-9 yr and tL data';
data.Li = 47;  units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 6e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'ADW';
  comment.Wwb = 'Computed from egg diameter of 2-3 mm of Coregonus kiyi: pi/6*0.225^3';
data.Wwp = 16.4;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00447*Lp^3.20, see F1';
data.Wwi = 1e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00447*Li^3.20, see F1';
    
data.Ri = 23600/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';   bibkey.Ri = 'fishbase';
  temp.Ri = C2K(8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data

% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
3.200	12.544
4.978	12.936
5.111	14.478
6.089	13.036
8.178	13.331
13.156	24.528
14.133	16.339
16.044	23.381
17.156	22.902
26.178	23.606];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
data.tL(:,2) = data.tL(:,2)/ 0.85; % convert SL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MuirVecs2014';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'males are assumed not to differ from females due to lack of data';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: W in g = 0.00447*(TL in cm)^3.20';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.85*TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = 'YDBM'; % Cat of Life
metaData.links.id_ITIS = '161938'; % ITIS
metaData.links.id_EoL = '46563168'; % Ency of Life
metaData.links.id_Wiki = 'Coregonus_sardinella'; % Wikipedia
metaData.links.id_ADW = 'Coregonus_sardinella'; % ADW
metaData.links.id_Taxo = '171735'; % Taxonomicon
metaData.links.id_WoRMS = '127181'; % WoRMS
metaData.links.id_fishbase = 'Coregonus-sardinella'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Coregonus_sardinella}}';  
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
bibkey = 'MuirVecs2014'; type = 'Article'; bib = [ ...  
'doi = {10.1111/eff.12098}, ' ...
'author = {Andrew M. Muir and Paul Vecsei and Michael Power and Charles C. Krueger and James D. Reist}, ' ...
'year = {2014}, ' ...
'title = {Morphology and life history of the {G}reat {S}lave {L}ake ciscoes ({S}almoniformes: {C}oregonidae}, ' ... 
'journal = {Ecology of Freshwater Fish}, ' ...
'pages = {453-469}, ' ...
'volume = {23}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Coregonus-sardinella.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Coregonus_kiyi}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

