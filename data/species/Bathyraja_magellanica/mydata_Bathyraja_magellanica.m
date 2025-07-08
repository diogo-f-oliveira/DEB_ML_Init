function [data, auxData, metaData, txtData, weights] = mydata_Bathyraja_magellanica

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Arhynchobatidae';
metaData.species    = 'Bathyraja_magellanica'; 
metaData.species_en = 'Magellan skate'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0iMb'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 07];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};  

metaData.author_mod_1  = {'Bas Kooijman'};        
metaData.date_mod_1    = [2024 10 26];                           
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_1 = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 26];

%% set data
% zero-variate data;
data.ab = 200;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(5.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on v = 0.032 cm/d, as is typical for Bathyraja';
data.am = 9*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'Buck2006';   
  temp.am = C2K(5.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 13;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'guess';
  comment.Lb = 'based on 0.18*Li, as typical for Bathyraja';
data.Lp = 57;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Buck2006';
data.Li  = 72;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Buck2006'; 

data.Wwi = 3.2e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.00490*Li^3.13, see F1'; 

data.Ri  = 40/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(5.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.65, as is typical for Bathyraja';

% uni-variate data
% time - length
data.tL = [ ... % time since birth (yr), total length (cm)
2.918	43.797
2.923	56.412
2.942	50.438
3.921	62.437
3.926	54.968
3.927	53.806
3.932	65.425
3.937	58.620
3.947	64.430
3.964	60.779
3.967	56.298
3.978	59.784
4.872	54.351
4.889	69.788
4.893	64.145
4.894	63.149
4.894	62.651
4.895	61.489
4.932	68.296
4.933	67.134
4.934	65.309
5.902	73.158
5.903	72.494
5.904	70.004
5.905	69.506
5.905	68.510
5.906	67.515
5.907	66.519
5.908	65.191
6.892	69.555
6.893	68.892
6.895	65.904
6.904	72.046
6.910	63.249
6.911	62.254
7.934	71.931
7.935	69.773
7.952	65.293
8.906	73.473];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(5.6); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Buck2006'; 
comment.tL = 'Data for combined sexes';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Lb = 5 * weights.Lb;
weights.Wwi = 5 * weights.Wwi;
weights.Ri = 0 * weights.Ri;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males and females are assumed not to differ';
D2 = 'temperatures are guessed';
D3 = 'mod_1: p_M is somewhat reduced; there is possibly a problem with aging';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g = 0.00372*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'KXV3'; % Cat of Life
metaData.links.id_ITIS = '564245'; % ITIS
metaData.links.id_EoL = '46560769'; % Ency of Life
metaData.links.id_Wiki = 'Bathyraja'; % Wikipedia
metaData.links.id_ADW = 'Bathyraja_magellanica'; % ADW
metaData.links.id_Taxo = '163720'; % Taxonomicon
metaData.links.id_WoRMS = '271521'; % WoRMS
metaData.links.id_fishbase = 'Bathyraja-magellanica'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bathyraja}}';  
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
bibkey = 'Buck2006'; type = 'phdthesis'; bib = [ ...
'author = {Amelie B\"{u}cker}, ' ...
'year = {2006}, ' ...
'title  = {Age and growth of skates of the genus \emph{Bathyraja} in Argentina}, ' ...
'school = {University of Bremen}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Bathyraja-magellanica.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
