  function [data, auxData, metaData, txtData, weights] = mydata_Clupeonella_cultriventris

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Ehiravidae';
metaData.species    = 'Clupeonella_cultriventris'; 
metaData.species_en = 'Black Sea sprat'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAm'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L_f'; 't-Ww_f'};

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};                  
metaData.date_subm   = [2019 03 26];                      
metaData.email       = {'bas.kooijman@vu.nl'};      
metaData.address     = {'VU University Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 26]; 

%% set data
% zero-variate data
data.am = 6*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'KiyaOsip2006';   
  temp.am = C2K(14.8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 6;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess'; 
data.Li = 14;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.6e-3;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'fishbase'; 
  comment.Wwb = 'based on egg diameter 1.7 mm for Clupea harengus: pi/6*0.17^3';
  
data.Ri = 2e4/365;   units.Ri = '#/d';  label.Ri = 'maximum reprod rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(14.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% uni-variate data
% time-length
data.tL2000 = [ ... % time since birth (yr), total length (cm)
    0 5.730
    1 8.632
    2 9.812];
data.tL2000(:,1) = 365 * (0.5 + data.tL2000(:,1));
units.tL2000 = {'d', 'cm'}; label.tL2000 = {'time since birth', 'total length'};  
  temp.tL2000 = C2K(14.8); units.temp.tL2000 = 'K'; label.temp.tL2000 = 'temperature';
bibkey.tL2000 = 'KiyaOsip2006';
comment.tL2000 = 'data for Rybinsk Reservoir in 2000';
%
data.tL2001 = [ ... % time since birth (yr), total length (cm)
    0 5.146
    1 7.808
    2 8.740];
data.tL2001(:,1) = 365 * (0.5 + data.tL2001(:,1));
units.tL2001 = {'d', 'cm'}; label.tL2001 = {'time since birth', 'total length'};  
  temp.tL2001 = C2K(14.8); units.temp.tL2001 = 'K'; label.temp.tL2001 = 'temperature';
bibkey.tL2001 = 'KiyaOsip2006';
comment.tL2001 = 'data for Rybinsk Reservoir in 2000';
%
data.tL2002 = [ ...% time since birth (yr), total length (cm)
    0 4.821
    1 7.424
    2 8.407];
data.tL2002(:,1) = 365 * (0.5 + data.tL2002(:,1));
units.tL2002 = {'d', 'cm'}; label.tL2002 = {'time since birth', 'total length'};  
  temp.tL2002 = C2K(14.8); units.temp.tL2002 = 'K'; label.temp.tL2002 = 'temperature';
bibkey.tL2002 = 'KiyaOsip2006';
comment.tL2002 = 'data for Rybinsk Reservoir in 2000';

% time-weight
data.tW2000 = [ ...% time since birth (yr), wet weight (g)
    0 1.93
    1 8.41
    2 9.77];
data.tW2000(:,1) = 365 * (0.5 + data.tW2000(:,1));
units.tW2000 = {'d', 'g'}; label.tW2000 = {'time since birth', 'wet weight'};  
  temp.tW2000 = C2K(14.8); units.temp.tW2000 = 'K'; label.temp.tW2000 = 'temperature';
bibkey.tW2000 = 'KiyaOsip2006';
comment.tW2000 = 'data for Rybinsk Reservoir in 2000';
%
data.tW2001 = [ % time since birth (yr), wet weight (g)
    0 1.50
    1 6.37
    2 9.24];
data.tW2001(:,1) = 365 * (0.5 + data.tW2001(:,1));
units.tW2001 = {'d', 'g'}; label.tW2001 = {'time since birth', 'wet weight'};  
  temp.tW2001 = C2K(14.8); units.temp.tW2001 = 'K'; label.temp.tW2001 = 'temperature';
bibkey.tW2001 = 'KiyaOsip2006';
comment.tW2001 = 'data for Rybinsk Reservoir in 2001';
%
data.tW2002 = [ % time since birth (yr), wet weight (g)
    0 1.16
    1 5.09
    2 8.76];
data.tW2002(:,1) = 365 * (0.5 + data.tW2002(:,1));
units.tW2002 = {'d', 'g'}; label.tW2002 = {'time since birth', 'wet weight'};  
  temp.tW2002 = C2K(14.8); units.temp.tW2002 = 'K'; label.temp.tW2002 = 'temperature';
bibkey.tW2002 = 'KiyaOsip2006';
comment.tW2002 = 'data for Rybinsk Reservoir in 2002';

%% set weights for all real data
weights = setweights(data, []);
weights.tL2000 = 2 * weights.tL2000;
weights.tL2001 = 2 * weights.tL2001;
weights.tL2002 = 2 * weights.tL2002;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL2002','tL2001','tL2000'}; subtitle1 = {'Data for 2002, 2001, 2000'};
set2 = {'tW2002','tW2001','tW2000'}; subtitle2 = {'Data for 2002, 2001, 2000'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Temperature are guessed, based on the preferred temperature as given by fishbase';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00759*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'WCWW'; % Cat of Life
metaData.links.id_ITIS = '161819'; % ITIS
metaData.links.id_EoL = '46562393'; % Ency of Life
metaData.links.id_Wiki = 'Clupeonella_cultriventris'; % Wikipedia
metaData.links.id_ADW = 'Clupeonella_cultriventris'; % ADW
metaData.links.id_Taxo = '171479'; % Taxonomicon
metaData.links.id_WoRMS = '126418'; % WoRMS
metaData.links.id_fishbase = 'Clupeonella-cultriventris'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Clupeonella_cultriventris}}';  
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
bibkey = 'KiyaOsip2006'; type = 'Article'; bib = [ ...  
'author = {V. I. Kiyashko and V. V. Osipov and Yu. V. Slyn''ko}, ' ...
'year = {2006}, ' ...
'title = {Size-Age Characteristics and Population Structure of \emph{Clupeonella cultriventris} at Its Naturalization in the {R}ybinsk {R}eservoir}, ' ... 
'journal = {Journal of Ichthyology}, ' ...
'volume = {46}, '...
'pages = {64-73}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Clupeonella-cultriventris.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  