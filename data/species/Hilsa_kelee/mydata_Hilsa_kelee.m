function [data, auxData, metaData, txtData, weights] = mydata_Hilsa_kelee
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Dorosomatidae';
metaData.species    = 'Hilsa_kelee'; 
metaData.species_en = 'Kelee shad'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIN', 'MPW'};
metaData.ecoCode.habitat = {'0iMpe', '0iFe'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 04 20];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 04 20]; 


%% set data
% zero-variate data;

data.am = 8*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(28.3);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Opisthonema_oglinum';

data.Lp  = 15;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty'; bibkey.Lp  = 'PanhLiub2013';
data.Li  = 35; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1 to 4 mm for Opisthonema_oglinum: pi/6*0.25^3';
data.Wwi = 482;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01047*Li^3.02, see F1';

data.Ri  = 350e3/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';  
  temp.Ri = C2K(28.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap=0.9';
  
% uni-variate data

% time-length data
data.tL = [ % time since Jan 1 (yr), total length (cm)
191.402	8.129
221.819	10.115
283.765	12.411
365+10.015	14.458
365+40.061	14.024
365+68.252	17.126
365+99.411	17.995
365+129.456	17.933
365+159.502	16.568
365+220.706	14.520
365+251.123	16.444
365+310.843	16.196
365+346.453	18.057];
data.tL(:,1) = data.tL(:,1) - 50; % convert time since Jan 1 to time since birth
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(28.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PanhLiub2013';
comment.tL = 'data reconstructed from length-frequency data';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.01047*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3LXJB'; % Cat of Life
metaData.links.id_ITIS = '551296'; % ITIS
metaData.links.id_EoL = '46562467'; % Ency of Life
metaData.links.id_Wiki = 'Hilsa_kelee'; % Wikipedia
metaData.links.id_ADW = 'Hilsa_kelee'; % ADW
metaData.links.id_Taxo = '176640'; % Taxonomicon
metaData.links.id_WoRMS = '212278'; % WoRMS
metaData.links.id_fishbase = 'Hilsa-kelee'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hilsa_kelee}}';
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
bibkey = 'PanhLiub2013'; type = 'Article'; bib = [ ... 
'doi = {10.1134/S0032945213030168}, ' ...
'author = {S. K. Panhwar and Q. Liub and G. Siddiqui}, ' ... 
'year = {2013}, ' ...
'title = {Growth, Mortality and Stock Assessment of Kelee Shad, \emph{Hilsa kelee} (Fam: {C}lupeidae) in the Coastal Waters of {P}akistan}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {53}, ' ...
'pages = {365-371}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Hilsa-kelee.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
  
