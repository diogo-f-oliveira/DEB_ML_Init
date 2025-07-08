function [data, auxData, metaData, txtData, weights] = mydata_Gila_pandora
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Gila_pandora'; 
metaData.species_en = 'Rio Grande chub'; 

metaData.ecoCode.climate = {'BSk','BWk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','jiFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 08 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 10]; 

%% set data
% zero-variate data

data.am = 5*365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'guess';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 9;    units.Lp = 'cm'; label.Lp = 'total length at puberty';           bibkey.Lp = 'fishesoftexas';
data.Li = 25;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'fishesoftexas'; 
  
data.Wwb = 2.8e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Gila elegans';
data.Wwp = 7.9;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';         bibkey.Wwp = {'fishbase','fishesoftexas'};
  comment.Wwp = 'based on 0.00813*Lp^3.13, F1';
data.Wwi = 193;   units.Wwi = 'g';  label.Wwi = 'wet weight at birth';         bibkey.Wwi = {'fishbase','fishesoftexas'};
  comment.Wwi = 'based on 0.00813*Li^3.13, F1';
  
data.Ri = 6322/365; units.Ri = '#/d';  label.Ri = 'ultimate reprod rate';  bibkey.Ri = 'fishesoftexas';
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
     
% univariate data
 
% time-length
data.tL = [ ... % time (yr), total length (cm)
 0 mean([ 2.7  5.4])
 1 mean([ 6.3 11.5])
 2 mean([14.0 15.3])
 3 mean([18.0 18.6])];
data.tL(:,1) = 365 * (0.8 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since hatch', 'total length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'fishesoftexas'; 

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Mean temperature is guessed';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00813*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1', F1); 

%% Links
metaData.links.id_CoL = '3G2GV'; % Cat of Life
metaData.links.id_ITIS = '163556'; % ITIS
metaData.links.id_EoL = '994808'; % Ency of Life
metaData.links.id_Wiki = 'Gila_pandora'; % Wikipedia
metaData.links.id_ADW = 'Gila_pandora'; % ADW
metaData.links.id_Taxo = '174946'; % Taxonomicon
metaData.links.id_WoRMS = '1026422'; % WoRMS
metaData.links.id_fishbase = 'Gila-pandora'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Gila_pandora}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Gila-pandora.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{txstate.fishesoftexas.org/gila pandora.htm}}';  
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
