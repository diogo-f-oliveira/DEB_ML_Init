function [data, auxData, metaData, txtData, weights] = mydata_Scomberomorus_brasiliensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Scombridae';
metaData.species    = 'Scomberomorus_brasiliensis'; 
metaData.species_en = 'Serra Spanish mackerel'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 11 12];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 12];

%% set data
% zero-variate data

data.ab = 1.02;   units.ab = 'd';   label.ab = 'age at birth';                 bibkey.ab = 'guess';   
  temp.ab = C2K(27.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 7*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'ChavBirn2021';   
  temp.am = C2K(27.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 37;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for female';  bibkey.Lp  = 'fishbase'; 
data.Li  = 125; units.Li  = 'cm';  label.Li  = 'ultimate fork length';    bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1 mm of Scomberomorus maculatus: pi/6*0.1^3';
data.Wwp = 340;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00776*Lp^2.96, see F1';
data.Wwi = 12.5e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00776*Li^2.96, see F1; max published weight 6.7 kg';

% uni-variate data

% time-length
data.tL = [ ... % yr class (yr), fork length (cm)
0.482	20.870
0.526	26.917
0.964	47.932
0.965	38.284
0.974	40.732
0.982	43.180
0.991	46.635
0.992	44.475
0.993	39.579
1.000	45.627
1.001	36.699
1.008	41.739
1.009	39.579
1.482	53.105
1.491	51.953
1.492	48.497
1.500	50.945
1.508	55.985
1.509	54.401
1.518	49.793
1.956	61.016
2.000	56.839
2.009	59.143
2.026	57.846
2.500	61.868
2.507	66.332
2.508	64.604
2.509	63.452
2.991	66.754
3.000	69.058
3.009	68.050
3.482	70.632
4.000	72.062
4.518	74.067
6.009	76.052
6.491	78.202]; 
data.tL(:,1) = (0 + data.tL(:,1)) * 365;   % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(27.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ChavBirn2021'; 

% length-fecundity
data.LN = [ % fork length (cm), fecundity (#)
46.989	65709.677
47.036	41322.581
49.004	59612.903
49.028	53516.129
49.048	103645.161
49.944	52161.290
49.964	96870.968
49.966	57580.645
49.988	83322.581
50.013	41322.581
50.030	147677.419
50.032	105677.419
50.975	34548.387
51.036	174096.774
51.043	44709.677
51.079	221516.129
51.081	201193.548
51.971	243870.968
51.981	60967.742
52.001	123290.323
52.025	101612.903
52.050	53516.129
52.978	258096.774
52.988	76548.387
52.990	42677.419
53.007	157838.710
53.969	142935.484
53.993	128709.677
54.018	84677.419
54.063	104322.581
54.954	138870.968
54.998	183580.645
57.993	262838.710
59.964	243193.548
59.965	218129.032
60.966	346161.290
65.017	391548.387];
units.LN   = {'cm', '#'};  label.LN = {'fork length', 'fecundity'};  
temp.LN    = C2K(27.5);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'ChavBirn2021'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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

%% Discussion
D1 = 'males are assumed not to differ from females';
D2 = 'data ab is ignorned; it probably relates to hatch, not birth';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00776*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4VTWR'; % Cat of Life
metaData.links.id_ITIS = '202045'; % ITIS
metaData.links.id_EoL = '46577320'; % Ency of Life
metaData.links.id_Wiki = 'Scomberomorus_brasiliensis'; % Wikipedia
metaData.links.id_ADW = 'Scomberomorus_brasiliensis'; % ADW
metaData.links.id_Taxo = '187065'; % Taxonomicon
metaData.links.id_WoRMS = '273811'; % WoRMS
metaData.links.id_fishbase = 'Scomberomorus-brasiliensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scomberomorus_brasiliensis}}';
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
bibkey = 'ChavBirn2021'; type = 'Article'; bib = [ ... 
'doi = {10.1590/2675-2824069.20-016pdtdcc  }, ' ...
'author = {Paulo de Tarso da Cunha Chaves and Pollyana Olbera Birnfeld and Andr\''{e} Martins Vaz-dos-Santos}, ' ... 
'year = {2021}, ' ...
'title = {Population dynamics of \emph{Scomberomorus brasiliensis} from a small-scale fishery off {S}outhern {B}razil}, ' ...
'journal = {Ocean and Coastal Research}, ' ...
'volume = {69}, ' ...
'pages = {e21013}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Scomberomorus-brasiliensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
