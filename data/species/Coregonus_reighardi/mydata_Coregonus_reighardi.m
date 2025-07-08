  function [data, auxData, metaData, txtData, weights] = mydata_Coregonus_reighardi
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Coregonus_reighardi'; 
metaData.species_en = 'Shortnose cisco'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
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
data.am = 8*365;   units.am = 'd';  label.am = 'life span';            bibkey.am = 'fishbase';   
  temp.am = C2K(8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 16.5;  units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'Jobe1943'; 
  comment.Lp = 'based on tp 5-9 yr and tL data';
data.Li = 36;  units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 6e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'ADW';
  comment.Wwb = 'Computed from egg diameter of 2-3 mm of Coregonus kiyi: pi/6*0.225^3';
data.Wwp = 44.7;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00537*Lp^3.22, see F1';
data.Wwi = 551;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00537*Li^3.22, see F1';
    
data.Ri = 34891/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';   bibkey.Ri = 'guess';
  temp.Ri = C2K(8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Coregonus_hoyi (which has the same size)';
  
% univariate data

% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
0	0.262
1	13.155
2	16.929
3	19.864
4	21.855
5	22.799
6	23.847
7	22.694];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
data.tL(:,2) = data.tL(:,2)/ 0.85; % convert SL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Jobe1943';

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
F1 = 'length-weight: W in g = 0.00537*(TL in cm)^3.22';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.85*TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '6B3P6'; % Cat of Life
metaData.links.id_ITIS = '161947'; % ITIS
metaData.links.id_EoL = '994761'; % Ency of Life
metaData.links.id_Wiki = 'Coregonus_reighardi'; % Wikipedia
metaData.links.id_ADW = 'Coregonus_reighardi'; % ADW
metaData.links.id_Taxo = '171732'; % Taxonomicon
metaData.links.id_WoRMS = '1016527'; % WoRMS
metaData.links.id_fishbase = 'Coregonus-reighardi'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Coregonus_reighardi}}';  
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
bibkey = 'Jobe1943'; type = 'Article'; bib = [ ...  
'doi = {10.1577/1548-8659(1942)72[108:TAGABD]2.0.CO;2}, ' ...
'author = {Frank W. Jobes}, ' ...
'year = {1943}, ' ...
'title = {The Age, Growth, and Bathymetric Distribution of {R}eighard''s Chub, \emph{Leucichthys reighardi} {K}oelz, in {L}ake {M}ichigan}, ' ... 
'journal = {Transactions of the American Fisheries Society}, ' ...
'pages = {108-135}, ' ...
'volume = {72(1)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Coregonus-reighardi.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Coregonus_kiyi}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

