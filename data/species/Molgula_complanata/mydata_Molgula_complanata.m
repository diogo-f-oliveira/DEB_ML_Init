function [data, auxData, metaData, txtData, weights] = mydata_Molgula_complanata

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Ascidiacea'; 
metaData.order      = 'Stolidobranchia'; 
metaData.family     = 'Molgulidae';
metaData.species    = 'Molgula_complanata'; 
metaData.species_en = 'Dwarf sea grape'; % translated from Dutch

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP','biAb'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2022 05 25];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 05 25]; 


%% set data
% zero-variate data;
data.ab = 14;     units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(10); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 93;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'FramMcCan1971';
  temp.tp = C2K(10); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 2*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 0.8;  units.Lp  = 'cm';  label.Lp  = 'diameter at puberty'; bibkey.Lp  = 'FramMcCan1971';

data.Wwb  = 2.45e-5;   units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth'; bibkey.Wwb  = 'FramMcCan1971';
  comment.Wwb = 'based on smallest diameter of 0.5 mm: Wwi*(0.05/2)^3';
data.Wwi  = 1.57;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'MarSpec';
  comment.Wwi = 'based on diameter 2 cm, height 1.5 cm, depth 1 cm (guess): pi/6*2*1.5*1';

data.Ri  = 2800/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap = 0.9';

% uni-variate data at f
% time-diameter
data.tL = [ ... % time since july 1 (d), diameter (mm)
13.900	1.770
44.083	5.391
75.061	4.684
166.007	11.661
197.779	15.523
227.168	17.180
258.145	16.554
287.137	21.336
318.908	17.905];
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL = {'d', 'cm'}; label.tL = {'time since July 1', 'diameter'};  
temp.tL = [ ... % time since july 1 (month), temperature (C)
 0	13.221
 1	15.673
 2	15.916
 3	16.703
 4	15.421
 5	11.496
 6	7.182
 7	3.339
 8	2.149
 9	-0.131
10	1.407
11	4.634
12	8.168];
temp.tL(:,1) = temp.tL(:,1) * 30.5; % convert month to d
temp.tL(:,2) = C2K(temp.tL(:,2)); % convert C to K
units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'FramMcCan1971'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack data and txt_data for output
auxData.temp   = temp;
txtData.units  = units;
txtData.label  = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = '';     
metaData.discussion = struct('D1',D1); 

%% Facts
F1 = 'The renal sac contains nitrogenous wastes, solid concretions composed of weddellite and calcite and an apicomplexan symbiont Nephromyces, which have endosymbiontic bacteria';
metaData.bibkey.F1 = 'Wiki';
F2 = 'Hermaphroditic; external fertilisation';
metaData.bibkey.F2 = 'Wiki';
F3 = 'Molgula-species have no tadpole-stage; an amoeboid individual leaves the egg';
metaData.bibkey.F3 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '43VDV'; % Cat of Life
metaData.links.id_ITIS = '159568'; % ITIS
metaData.links.id_EoL = '46584403'; % Ency of Life
metaData.links.id_Wiki = 'Molgula'; % Wikipedia
metaData.links.id_ADW = 'Molgula_complanata'; % ADW
metaData.links.id_Taxo = '41540'; % Taxonomicon
metaData.links.id_WoRMS = '103776'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Molgula}}'; 
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
bibkey = 'FramMcCan1971'; type = 'article'; bib = [ ...
'author = {David W. Frame and James A. McCann}, ' ...
'year = {1971}, ' ...
'title  = {Growth of \emph{Molgula complanata} {A}lder and {H}ancock, 1870 Attached to Test Panels in the {C}ape {C}od {C}anal}, ' ...
'journal = {Chesapeake Science}, ' ...
'volume = {12(2)}, '...
'pages = {62-66}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MarSpec'; type = 'Misc'; bib = ...
'howpublished = {\url{http://species-identification.org/species.php?species_group=tunicata&id=33}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

