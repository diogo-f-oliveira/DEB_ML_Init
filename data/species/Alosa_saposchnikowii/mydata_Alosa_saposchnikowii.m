  function [data, auxData, metaData, txtData, weights] = mydata_Alosa_saposchnikowii

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Alosidae';
metaData.species    = 'Alosa_saposchnikowii'; 
metaData.species_en = 'Saposhnikovi shad'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAm'};
metaData.ecoCode.habitat = {'0iMpe', 'piFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2019 03 28];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 28]; 

%% set data
% zero-variate data
data.am = 9*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 21.5;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess'; 
  comment.Lp = 'based on same relative length, compared to Alosa sapidissima: 38.1*43/76';
data.Li = 38.1;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 0.0141;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 3 mm for Alosa alosa: pi/6*0.1^3';
data.Wwi = 469;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  
data.Ri = 1.2e4/365;units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'guess';   
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.5';
  
% uni-variate data
% time-length
data.tL = [ ... % time since hatch (d), total length (cm)
    2 17.7
    3 20.9
    4 23.5
    5 24.8
    6 26.4
    7 28.0
    8 28.5];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = {'MalkAndr2008'};

% time-weight
data.tW = [ ... % time since hatch (d), wet weight (g)
    2 79.3
    3 133.2
    4 180.3
    5 248.5
    6 302.5
    7 341.7
    8 391.0];
data.tW(:,1) = 365 * (0.5 + data.tW(:,1)); % convert yr to d
units.tW = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
  temp.tW = C2K(10);  units.temp.tW = 'K'; label.temp.tW = 'temperature'; 
bibkey.tW = {'MalkAndr2008'};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
                                 
%% Links
metaData.links.id_CoL = 'C5MV'; % Cat of Life
metaData.links.id_ITIS = '615816'; % ITIS
metaData.links.id_EoL = '46562381'; % Ency of Life
metaData.links.id_Wiki = 'Alosa_saposchnikowii'; % Wikipedia
metaData.links.id_ADW = 'Alosa_saposchnikowii'; % ADW
metaData.links.id_Taxo = '654692'; % Taxonomicon
metaData.links.id_WoRMS = '272254'; % WoRMS
metaData.links.id_fishbase = 'Alosa-saposchnikowii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Alosa_saposchnikowii}}';  
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
bibkey = 'MalkAndr2008'; type = 'Article'; bib = [ ...  
'author = {E. M. Malkin and S. B. Andrianova}, ' ...
'year = {2008}, ' ...
'title = {Biology and Traits of the Formation of Stock of Big-Eyed Shad \emph{Alosa saposchnikowii}}, ' ... 
'journal = {Journal of Ichthyology}, ' ...
'volume = {48}, '...
'pages = {443-451}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Alosa-saposchnikowii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  