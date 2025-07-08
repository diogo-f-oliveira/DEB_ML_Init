  function [data, auxData, metaData, txtData, weights] = mydata_Percina_peltata
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Percina_peltata'; 
metaData.species_en = 'Shield darter'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Ft'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 09 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 12]; 

%% set data
% zero-variate data
data.am = 4 * 365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'fishbase';   
  temp.am = C2K(12.5); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lp = 4.8;  units.Lp = 'cm'; label.Lp = 'total length at puberty';           bibkey.Lp = 'guess'; 
data.Li = 9;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'fishbase';
 
data.Wwb = 1.2e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishesoftexas';
  comment.Wwb = 'based on egg diameter of 1.3 mm of P. caprodes: pi/6*0.13^3';
data.Wwp = 0.71; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp =  {'fishbase','guess'};
   comment.Wwp = 'relationship 0.00513*Lp^3.14 (see F1)';
data.Wwi = 5.09; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
   comment.Wwi = 'relationship 0.00513*Li^3.14 (see F1)';
 
data.Ri = 600/365;   units.Ri = '#/d';  label.Ri = 'ultimate reproduction rate';  bibkey.Ri = 'guess';
  temp.Ri = C2K(12.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL = [ ... % year class (yr), total length (cm)
    0 4.27
    1 5.40
    2 6.21
    3 6.60];
data.tL(:,1) = 365 * (1 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(12.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Link1970';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Facts
F1 = 'length-weight Ww in g = 0.00513 * (TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6V3SP'; % Cat of Life
metaData.links.id_ITIS = '168474'; % ITIS
metaData.links.id_EoL = '207988'; % Ency of Life
metaData.links.id_Wiki = 'Percina_peltata'; % Wikipedia
metaData.links.id_ADW = 'Percina_peltata'; % ADW
metaData.links.id_Taxo = '183489'; % Taxonomicon
metaData.links.id_WoRMS = '1021027'; % WoRMS
metaData.links.id_fishbase = 'Percina-peltata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Percina_peltata}}';  
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
bibkey = 'Link1970'; type = 'Phdthesis'; bib = [ ...  
'author = {Garnett William Link}, ' ...
'year = {1970}, ' ...
'title = {Comparative age and growth of two darters, \emph{Percina peltata} ({S}tauffer) and \emph{Percina notogramma} ({R}aney and {H}ubbs), in {V}irginia}, ' ... 
'school = {University of Richmond}, ' ...
'number = {327}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Percina-peltata}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/percina caprodes.htm}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
