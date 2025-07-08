function [data, auxData, metaData, txtData, weights] = mydata_Sillago_japonica

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sillaginidae';
metaData.species    = 'Sillago_japonica'; 
metaData.species_en = 'Japanese whiting';

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'biMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 14];

%% set data
% zero-variate data

data.ab = 4.5;     units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(21.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 6*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'Wiki';   
  temp.am = C2K(21.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'at least 5 yrs';

data.Lp  = 15; units.Lp  = 'cm'; label.Lp  = 'fork length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 30;     units.Li  = 'cm'; label.Li  = 'ultimate fork length';  bibkey.Li  = 'fishbase';

data.Wwb = 1.5e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.66 mm of Sillago sihama: pi/6*0.066^3';
data.Wwi = 201.9;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';
 comment.Wwi = 'based on 0.00631*Li^3.05, see F1';
 
data.Ri  = 68900/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(21.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Fecundity 68900';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since hatch (d), total length (cm)
    1  7.1  7.0
    2 13.3 13.4
    4 23.6 23.7];
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0) * 365;
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm  = C2K(21.3); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
treat.tL_fm = {1, {'females','males'}};
bibkey.tL_fm = 'SuliKita1999';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.Li = 3 * weights.Li;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ for females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00631*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4XDQL'; % Cat of Life
metaData.links.id_ITIS = '646047'; % ITIS
metaData.links.id_EoL = '46579901'; % Ency of Life
metaData.links.id_Wiki = 'Sillago_japonica'; % Wikipedia
metaData.links.id_ADW = 'Sillago_japonica'; % ADW
metaData.links.id_Taxo = '187650'; % Taxonomicon
metaData.links.id_WoRMS = '273944'; % WoRMS
metaData.links.id_fishbase = 'Sillago-japonica'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sillago_japonica}}';
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
bibkey = 'SuliKita1999'; type = 'Article'; bib = [ ... 
'author = {Sulistiono, Masashi Yokota and Shuichi Kitada and Seiichi Watanabe}, ' ... 
'year = {1999}, ' ...
'title = {Age and Growth of {J}apanese Whiting \emph{Sillago japonica} in {T}ateyama {B}ay}, ' ...
'journal = {Fisheries Science}, ' ...
'volume = {65(1)}, ' ...
'pages = {117-122}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Sillago-japonica.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
