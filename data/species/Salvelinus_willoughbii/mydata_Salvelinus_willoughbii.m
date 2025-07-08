  function [data, auxData, metaData, txtData, weights] = mydata_Salvelinus_willoughbii

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Salvelinus_willoughbii'; 
metaData.species_en = 'Windermere charr'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFl'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2019 02 26];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data
data.ab = 72; units.ab = 'd'; label.ab = 'age at birth';     bibkey.ab = 'fishbase'; 
  temp.ab = C2K(7); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '64 to 80 d';
data.am = 8*365;  units.am = 'd';   label.am = 'life span';              bibkey.am = 'FrosKipl1980';   
  temp.am = C2K(5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 15;     units.Lp = 'cm';  label.Lp = 'total length at puberty';bibkey.Lp = 'guess'; 
data.Li = 37.5;    units.Li = 'cm';  label.Li = 'ultimate standard length';  bibkey.Li = 'FrosKipl1980';

data.Wwb = 8.2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at hatch';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.5 mm: pi/6*0.25^3';
data.Wwi = 596;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = {'FrosKipl1980','fishbase'};
  comment.Wwi = 'based on 0.00977*Li^3.04, see F1';
  
data.Ri = 2.5e3/365; units.Ri = '#/d'; label.Ri = 'maximum reprod rate';   bibkey.Ri = 'guess';   
  temp.Ri = C2K(7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.96, as found for Salvelinus alpinus';
    
% uni-variate data
% time-length
data.tL_f = [... % time since birth (yr), length (cm)
1.026	5.478
2.059	10.043
3.069	17.217
4.028	24.913
4.984	29.087
5.963	31.043
6.968	32.478];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'length', 'female'};  
temp.tL_f = C2K(8.5); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = {'FrosKipl1980'};
comment.tL_f = 'Data for spring-spawning females; not clear if this concerns SL or TL';
%
data.tL_m = [... % time since birth (yr), length (cm)
1.095	5.609
2.086	10.565
3.083	18.000
4.028	25.304
5.096	30.130
6.079	32.087
7.062	33.913];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'length', 'male'};  
temp.tL_m = C2K(8.5); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = {'FrosKipl1980'};
comment.tL_m = 'Data for spring-spawning males; not clear if this concerns SL or TL';

% length-weight
data.LW_f = [... % lnegth (cm), wet weight (g)
    5.3   1
   10.0   8
   17.1  47
   25.0 181
   29.2 280
   31.2 338
   32.3 369
   32.0 362];
units.LW_f = {'cm', 'g'};     label.LW_f = {'length','wet weight','female'};  
bibkey.LW_f = {'FrosKipl1980'};
comment.LW_f = 'Data for spring-spawning females; not clear if this concerns SL or TL';
%
data.LW_m = [... % lnegth (cm), wet weight (g)
    5.4   1
   10.5  10
   17.8  54
   25.6 194
   29.9 300
   32.1 366
   33.6 419
   33.5 412];
units.LW_m = {'cm', 'g'};     label.LW_m = {'length','wet weight','male'};  
bibkey.LW_m = {'FrosKipl1980'};
comment.LW_m = 'Data for spring-spawning males; not clear if this concerns SL or TL';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for female, male spring spawners'};
set2 = {'LW_f', 'LW_m'}; subtitle2 = {'Data for female, male spring spawners'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'temperatures are guessed; known as a cold-water species';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g = 0.00977*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Char does not die after spawning like Pacific salmon and often spawn several times throughout their lives, typically every second or third year. ';
metaData.bibkey.F2 = 'Wiki'; 
F3 = 'Dwarf growth occurs, and autumn spawners stay smaller than spring spawners';
metaData.bibkey.F3 = 'FrosKipl1980'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);
                                 
%% Links
metaData.links.id_CoL = '79FQV'; % Cat of Life
metaData.links.id_ITIS = '623551'; % ITIS
metaData.links.id_EoL = '1156861'; % Ency of Life
metaData.links.id_Wiki = 'Salvelinus_willoughbii'; % Wikipedia
metaData.links.id_ADW = 'Salvelinus_willoughbii'; % ADW
metaData.links.id_Taxo = '186489'; % Taxonomicon
metaData.links.id_WoRMS = '1021127'; % WoRMS
metaData.links.id_fishbase = 'Salvelinus-willoughbii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Salvelinus_willughbii}}';  
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
bibkey = 'FrosKipl1980'; type = 'Article'; bib = [ ...  
'author = {W. E. Frost and C. Kipling}, ' ...
'year = {1980}, ' ...
'title = {The growth of charr, \emph{Salvelinus willughbii} {G}unther, in {W}indermere}, ' ... 
'journal = {J. Fish Biol.}, ' ...
'volume = {16}, '...
'pages = {279-289}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Salvelinus-willoughbii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
