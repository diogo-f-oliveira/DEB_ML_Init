function [data, auxData, metaData, txtData, weights] = mydata_Dentiraja_australis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Dentiraja_australis'; 
metaData.species_en = 'Sydney skate';

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0iMcd','0iMm'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 14];

%% set data
% zero-variate data;
data.ab = 11*30.5;  units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';    
  temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 26*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 27;     units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'ReisFigu2020';
data.Lp  = 45.5;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'fishbase'; 
data.Li  = 55;    units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwi = 1.3e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00302*Li^3.24, see F1';

data.Ri  = 8/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Dentiraja_polyommata';

% uni-variate data at f
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.993	38.545
0.995	32.511
1.036	35.701
2.008	45.711
2.010	38.815
2.011	35.108
2.013	30.022
2.973	44.946
2.984	41.584
2.995	40.894
3.003	48.222
3.003	47.360
3.006	39.429
3.012	50.808
3.024	46.670
3.028	36.843
3.967	49.784
3.968	48.491
3.968	46.250
3.989	47.715
3.989	47.370
3.989	46.767
4.001	42.715
4.010	45.216
4.974	48.674
4.983	52.036
4.984	49.278
4.985	46.605
4.986	43.588
4.995	48.243
4.995	47.554
4.996	45.916
5.005	50.743
5.016	46.778
5.027	44.537
5.028	42.899
5.970	48.340
5.971	46.530
5.991	47.737
6.001	49.806
6.002	45.496
6.011	51.444
6.012	49.030
6.012	47.047
6.021	50.582
6.977	49.041
6.988	47.317];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth','total length'};  
  temp.tL = C2K(20); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ReisFigu2020';

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

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00302*(TL in cm)^3.24';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6CKFC'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '51263465'; % Ency of Life
metaData.links.id_Wiki = 'Dentiraja_australis'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5347551'; % Taxonomicon
metaData.links.id_WoRMS = '1019871'; % WoRMS
metaData.links.id_fishbase = 'Dentiraja-australis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dentiraja_australis}}'; 
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
bibkey = 'ReisFigu2020'; type = 'Article'; bib = [ ... 
'author = {Marcelo Reis and Will F. Figueira}, ' ... 
'year = {2020}, ' ...
'title = {Age, growth and reproductive biology of two endemic demersal bycatch elasmobranchs: \emph{Trygonorrhina fasciata} and \emph{Dentiraja australis} ({C}hondrichthyes: {R}hinopristiformes, {R}ajiformes) from {E}astern {A}ustralia}, ' ...
'journal = {Zoologia}, ' ...
'volume = {37}, ' ...
'pages = {e49318}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Dentiraja-australis.html}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
 