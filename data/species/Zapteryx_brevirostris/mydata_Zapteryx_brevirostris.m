function [data, auxData, metaData, txtData, weights] = mydata_Zapteryx_brevirostris

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rhinopristiformes'; 
metaData.family     = 'Rhinobatidae';
metaData.species    = 'Zapteryx_brevirostris'; 
metaData.species_en = 'Shortnose guitarfish';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0iMcd','0iMm'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 04];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 11 04]; 

%% set data
% zero-variate data;
data.ab = 11*30.5;  units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'fishbase';    
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 11*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'CarmFava2018';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 14.5;     units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'fishbase';
  comment.Lb = '13-16 cm';
data.Lp  = 45;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'fishbase'; 
  comment.Lp = '42-48 cm';
data.Lpm  = 44.5;   units.Lpm = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'fishbase'; 
  comment.Lpm = '43-45 cm';
data.Li  = 59.3;    units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';
data.Lim  = 53.4;    units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males'; bibkey.Lim  = 'fishbase';

data.Wwi = 1.55e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00741*Li^3.00, see F1';

data.Ri  = 6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-8 pups per litter; assumed 1 litter per 1 yr';

% uni-variate data at f
data.tL = [ ... % time since birth (yr), total length (cm)
    0 18.93
    1 22.55
    2 26.11
    3 29.81
    4 33.47
    5 36.57
    6 38.69
    7 40.39
    8 41.83
    9 42.79
   10 44.09];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth','total length'};  
  temp.tL = C2K(25); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CarmFava2018';
comment.tL = 'sexes combined, but treated as female';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 5 * weights.psd.p_M;
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00741 * (TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Ovoviviparous';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '5CX6R'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46560711'; % Ency of Life
metaData.links.id_Wiki = 'Zapteryx_brevirostris'; % Wikipedia
metaData.links.id_ADW = 'Zapteryx_brevirostris'; % ADW
metaData.links.id_Taxo = '190223'; % Taxonomicon
metaData.links.id_WoRMS = '283212'; % WoRMS
metaData.links.id_fishbase = 'Zapteryx-brevirostris'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Zapteryx_brevirostris}}'; 
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
bibkey = 'CarmFava2018'; type = 'Article'; bib = [ ... 
'doi = {10.1590/1982-0224-20170005}, ' ...
'author = {Wanessa P. D. Carmo and Lu''{i}s Fernando F\''{a}varo1 and Rui Coelho}, ' ... 
'year = {2018}, ' ...
'title = {Age and growth of \emph{Zapteryx brevirostris} ({E}lasmobranchii: {R}hinobatidae) in southern {B}razil}, ' ...
'journal = {Neotropical Ichthyology}, ' ...
'volume = {16(1)}, ' ...
'pages = {e170005}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Zapteryx-brevirostris.html}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
 