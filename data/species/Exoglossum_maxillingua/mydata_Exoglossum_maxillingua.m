function [data, auxData, metaData, txtData, weights] = mydata_Exoglossum_maxillingua

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Exoglossum_maxillingua'; 
metaData.species_en = 'Cutlib minnow'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc','0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 08 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 05]; 

%% set data
% zero-variate data

data.am = 4*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'PappDale1964';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 7.6;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'CowlAlle2013'; 
data.Li = 16;    units.Li = 'cm'; label.Li = 'ultimate total length';         bibkey.Li = 'fishbase';
  
data.Wwb = 4.2e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'MaurGree2001';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwp = 4.65;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'CowlAlle2013','fishbase'};
  comment.Wwi = 'based on 0.00813*Lp^3.13, see F1';
data.Wwi = 47.7;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00813*Li^3.13, see F1';

data.Ri  = 1177/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'CowlAlle2013';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% univariate data
 
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
1  6.0
2  8.6
3 11.3
4 13.1];
data.tL(:,1) = 365 * (0.2 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PappDale1964'; 
comment.tL = 'Data from Lehigh River, Pennsylvania';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'Males are supposed not to differ from females';
D2 = 'Mean temperature is guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: W in g = 0.00813*(TL in cm)^3.13'; 
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '3DNCH'; % Cat of Life
metaData.links.id_ITIS = '163356'; % ITIS
metaData.links.id_EoL = '994798'; % Ency of Life
metaData.links.id_Wiki = 'Exoglossum_maxillingua'; % Wikipedia
metaData.links.id_ADW = 'Exoglossum_maxillingua'; % ADW
metaData.links.id_Taxo = '174441'; % Taxonomicon
metaData.links.id_WoRMS = '1026585'; % WoRMS
metaData.links.id_fishbase = 'Exoglossum-maxillingua'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Exoglossum_maxillingua}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Exoglossum-maxillingua.html}}';  
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
bibkey = 'PappDale1964'; type = 'Article'; bib = [ ... 
'author = {Pappantoniou, Antonios and Dale, George and Schmidt, Robert E.}, ' ... 
'year = {1964}, ' ...
'title = {Aspects of the life history of the cutlips minnow, \emph{Exoglossum maxillingua}, from two {E}eastern {P}ennsylvania streams}, ' ...
'journal = {J. Freshw. Ecol.}, ' ...
'volume = {2(5)}, ' ...
'pages = {440-458}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MaurGree2001'; type = 'Article'; bib = [ ... 
'author = {Augene G. Maurakis and Terre D. Green}, ' ... 
'year = {2001}, ' ...
'title = {Aspects of the life history of the cutlips minnow, \emph{Exoglossum maxillingua}, from two {E}eastern {P}ennsylvania streams}, ' ...
'journal = {Verginia J. Sci}, ' ...
'volume = {52(1)}, ' ...
'pages = {25-34}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CowlAlle2013'; type = 'techreport'; bib = [ ... 
'author = {David E. Cowley and Janelle Alleman and Ryan R. McShane and Patrick D. Shirey and Rossana Sallenave}, ' ... 
'year = {2013}, ' ...
'title = {COSEWIC assessment and status report on the Cutlip Minnow \emph{Exoglossum maxillingua} in {C}anada}, ' ...
'institute = {Committee on the Status of Endangered Wildlife in Canada. Ottawa}, ' ...
'howpublished = {\url{www.registrelep-sararegistry.gc.ca/default_e.cfm}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
