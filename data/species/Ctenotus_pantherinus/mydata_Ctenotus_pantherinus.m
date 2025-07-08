function [data, auxData, metaData, txtData, weights] = mydata_Ctenotus_pantherinus
%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Scincidae';
metaData.species    = 'Ctenotus_pantherinus';
metaData.species_en = 'Leopard Ctenotus';

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTg','0iTd'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 06];

%% set data
% zero-variate data;
data.ab = 50;  units.ab = 'd';      label.ab = 'age at birth';             bibkey.ab = 'guess';
temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 269;     units.tp = 'd'; label.tp = 'time since birth at puberty'; bibkey.tp = 'Jame1991';
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'in 1986, but 406 d  in 1987';
data.tpm = 242;     units.tpm = 'd'; label.tpm = 'time since birth at puberty'; bibkey.tpm = 'Jame1991';
  temp.tpm = C2K(25);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
  comment.tpm = 'in 1986, but 256 d in 1987';
data.am = 7*365;     units.am = 'd'; label.am = 'life span';               bibkey.am = 'GulOzem2015';
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 3.2;  units.Lb  = 'cm';  label.Lb  = 'SVL at birth';   bibkey.Lb  = 'guess';
data.Lp  = 8.8;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';   bibkey.Lp  = 'Gold2008';
data.Lpm  = 7.2; units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males';   bibkey.Lpm  = 'Gold2008';
data.Li  = 10;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'Jame1991';
data.Lim = 8.5;  units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'Jame1991';

data.Wwb = 0.5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwim = 'based on 15*(3.2/10)^3';
data.Wwi = 15; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'Jame1991';
  comment.Wwi = 'based on 54*(7.11/11)^3';
data.Wwim = 9.2; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'Jame1991';
  comment.Wwim = 'based on 15*(8.5/10)^3';

data.Ri  = 5.8/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Gold2008';
temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4-8 eggs per clutch, 1 clutch per yr';

% uni-variate data
% length-change in length
data.LdL_f = [... % SVL (m), change in SVL (cm/d)
4.733	0.019
4.799	0.010
5.127	0.014
5.228	0.024
5.422	0.000
5.537	0.017
5.680	0.012
5.689	0.009
5.794	0.013
5.844	0.018
5.848	0.005
5.864	0.006
5.885	0.018
5.937	0.008
6.004	0.007
6.048	0.008
6.061	0.007
6.080	0.010
6.096	0.011
6.104	0.000
6.112	0.013
6.161	0.009
6.177	0.002
6.180	0.004
6.270	0.030
6.288	0.017
6.344	0.010
6.382	0.008
6.389	0.004
6.470	0.010
6.507	0.008
6.529	0.004
6.562	0.015
6.574	0.007
6.619	0.008
6.658	0.022
6.688	0.008
6.716	0.000
6.739	0.020
6.856	0.008
6.913	0.009
6.915	0.010
6.938	0.008
7.008	0.000
7.016	0.005
7.021	0.007
7.064	0.008
7.085	0.012
7.135	0.009
7.196	0.011
7.203	0.008
7.232	0.009
7.248	0.010
7.253	0.012
7.260	0.009
7.305	0.010
7.345	0.009
7.350	0.004
7.438	0.007
7.481	0.000
7.766	0.011
7.769	0.005
7.802	0.000
7.941	0.008
7.995	0.015
8.005	0.027
8.026	0.024
8.052	0.008
8.089	0.020
8.106	0.015
8.110	0.016
8.163	0.000
8.203	0.014
8.243	0.006
8.244	0.006
8.271	0.021
8.303	0.001
8.330	0.008
8.365	0.004
8.429	0.001
8.511	0.000
8.547	0.012
8.609	0.001
8.610	0.009
8.634	0.006
8.680	0.002
8.682	0.002
8.685	0.004
8.718	0.014
8.723	0.002
8.734	0.001
8.736	0.009
8.836	0.003
8.837	0.003
8.838	0.004
8.856	0.006
8.892	0.003
8.901	0.001
8.935	0.004
8.985	0.001
9.070	0.001
9.082	0.001
9.127	0.002
9.140	0.002
9.160	0.013
9.169	0.003
9.174	0.005
9.238	0.002
9.264	0.001
9.327	0.005
9.335	0.002
9.353	0.004
9.361	0.001
9.363	0.009
9.458	0.001
9.461	0.002
9.463	0.003
9.571	0.001
9.696	0.009
9.696	0.001
9.722	0.001
9.780	0.002
9.792	0.001
9.797	0.003
9.870	0.005
9.890	0.001
9.917	0.008
9.973	0.000];
units.LdL_f  = {'cm', 'cm/d'};  label.LdL_f = {'SVL', 'change in SVL', 'female'};  
temp.LdL_f   = C2K(20);  units.temp.LdL_f = 'K'; label.temp.LdL_f = 'temperature';
bibkey.LdL_f = 'Jame1991'; 
%
data.LdL_m = [... % SVL (m), change in SVL (cm/d)
4.395	0.020
4.829	0.020
5.005	0.017
5.056	0.014
5.181	0.013
5.312	0.008
5.397	0.016
5.452	0.016
5.681	0.019
5.836	0.012
5.849	0.011
5.864	0.012
5.865	0.012
6.063	0.013
6.074	0.019
6.108	0.008
6.271	0.012
6.340	0.012
6.459	0.008
6.481	0.012
6.489	0.017
6.493	0.011
6.502	0.009
6.512	0.007
6.546	0.010
6.609	0.013
6.652	0.006
6.711	0.008
6.783	0.001
6.822	0.000
6.824	0.024
6.926	0.018
6.957	0.005
6.998	0.012
7.041	0.020
7.053	0.019
7.118	0.001
7.314	0.016
7.350	0.005
7.359	0.003
7.363	0.005
7.368	0.000
7.439	0.008
7.445	0.004
7.457	0.003
7.474	0.012
7.494	0.000
7.578	0.008
7.590	0.006
7.671	0.005
7.675	0.007
7.676	0.000
7.682	0.003
7.769	0.012
7.785	0.006
7.795	0.003
7.867	0.005
7.886	0.000
7.899	0.007
7.974	0.002
7.977	0.003
8.022	0.005
8.048	0.004
8.057	0.001
8.072	0.002
8.110	0.007
8.112	0.001
8.214	0.003
8.238	0.001
8.278	0.000
8.290	0.007
8.324	0.002
8.337	0.002
8.394	0.002
8.407	0.002
8.480	0.003
8.488	0.000
8.490	0.001
8.505	0.002
8.549	0.003
8.618	0.002
8.621	0.004
8.642	0.000
8.727	0.001
8.769	0.000
8.831	0.004
8.834	0.006
8.983	0.003
9.007	0.000
9.124	0.003
9.267	0.005];
units.LdL_m  = {'cm', 'cm/d'};  label.LdL_m = {'SVL', 'change in SVL', 'male'};  
temp.LdL_m   = C2K(20);  units.temp.LdL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.LdL_m = 'Jame1991'; 

%% set weights for all real data
weights = setweights(data, []);
%weights.LdL_f = 3 * weights.LdL_f;
%weights.LdL_m = 3 * weights.LdL_m;
weights.Li = 10 * weights.Li;
weights.Lim = 10 * weights.Lim;
weights.Lb = 3 * weights.Lb;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LdL_f','LdL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Termite specialist';
metaData.bibkey.F1 = 'Jame1991'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '327MS'; % Cat of Life
metaData.links.id_ITIS = '1181995'; % ITIS
metaData.links.id_EoL = '795227'; % Ency of Life
metaData.links.id_Wiki = 'Ctenotus_pantherinus'; % Wikipedia
metaData.links.id_ADW = 'Ctenotus_pantherinus'; % ADW
metaData.links.id_Taxo = '91072'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Ctenotus&species=pantherinus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ctenotus_pantherinus}}';   
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
bibkey = 'Jame1991'; type = 'Article'; bib = [ ...  
'author = {Craig D. James}, ' ...
'title = {Growth Rates and Ages at Maturity of Sympatric Scincid Lizards \emph{Ctenotus}) in {C}entral {A}ustralia}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {25(3)}, ' ...
'pages = {284-295}, ' ...
'year = {1991}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gold2008'; type = 'Article'; bib = [ ...  
'author = {Stephen R. Goldberg}, ' ...
'title = {NOTES ON REPRODUCTION OF FOUR SPECIES OF \emph{Ctenotus}:\emph{C. leonhardii}, \emph{C. pantherinus}, \emph{C. quattuordecimlineatus} AND \emph{C. schomburgkii} ({S}CINCIDAE)}, ' ...
'journal = {Herpetofauna}, ' ...
'volume = {38(1)}, ' ...
'pages = {8-13}, ' ...
'year = {2008}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

